/*
Same with `main_stopwatch.c` but using timer instead of `usleep`.

Assignment:
Using timer, make stopwatch that activated per 10ms.
It must contain 4 functionality triggered with user key input in thread.
The functionalities are:
- Start
- Stop
- Resume
- Clear

w========================================================================

Keyboard settings

- s : clear and start timer
- r : resume timer
- c : clear timer
- p : pause timer
*/

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <math.h>
#include <string.h>
#include <signal.h>
#include <pthread.h>

#include <sys/mman.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/ioctl.h>

#include <linux/fb.h>
#include <linux/input.h>

#include "gstub.h"

#define CLOCKID CLOCK_REALTIME
#define SIG SIGRTMIN

#define MEGA 1000000
#define GIGA 1000000000

typedef unsigned int uint;
typedef unsigned char byte;
typedef unsigned short int U32;


int fb_init(fb_dev *dev, const char *fb_name);
void* get_key(void* arg);
void DisplayTime(fb_dev *fb, IMAGE *fonts[], uint min, uint sec, uint msec, int x, int y);
static void timer_action(int sig, siginfo_t *si, void *uc);


// flag attributes
volatile byte quit_flag = 0;
volatile byte start_flag = 0;
volatile byte clear_flag = 0;
    
// time attributes
volatile uint min = 0, sec = 0, msec = 0;


int main(int argc, char* argv[]) {
    int i;
    
    // image attributes
    fb_dev fb;
    IMAGE *bg, *num_fonts, *nums[11];
    
    // thread attributes
    pthread_t thread_keyin;
    
    char key = 0;
    
    // timer attributes
    timer_t timer_stopwatch;
    struct sigevent sev;
    struct itimerspec its;
    long long freq_nanosecs = 10 * MEGA; // 10ms
    sigset_t mask;
    struct sigaction sa;
    
    
    if(fb_init(&fb, "/dev/fb0") < 0) {
        perror("can't init fb\n");
        return -1;
    }
    
    // Reading image file
    if(argc < 2) bg = ReadBMP("./bg2.bmp", 0);
    else bg = ReadBMP(argv[1], 0);
    if(bg < 0) {
        printf("Background image file open failed.\n");
        return -1;
    }
    
    // Load font image file
    num_fonts = ReadBMP("./num_fonts.bmp", 0);
    SeparateFonts(num_fonts, nums, 23, 40, 11);
    
    // Draw background image and timer 00:00:00
    draw_bmp(&fb, bg, 0, 0, 0);
    DisplayTime(&fb, nums, 0, 0, 0, 300, 250);
    
    // Create thread for key input
    pthread_create(&thread_keyin, NULL, get_key, &key);
    
    // Setting timer
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = timer_action;
    sigemptyset(&sa.sa_mask);
    if(sigaction(SIG, &sa, NULL) == -1) {
        perror("sigaction");
        return -1;
    }
    
    sigemptyset(&mask);
    sigaddset(&mask, SIG);
    
    if(sigprocmask(SIG_SETMASK, &mask, NULL) == -1) {
        perror("sigprocmask SIG_SETMASK");
        return -1;
    }
    
    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIG;
    sev.sigev_value.sival_ptr = &timer_stopwatch;
    
    if(timer_create(CLOCKID, &sev, &timer_stopwatch) == -1) {
        perror("timer create");
        return -1;
    }
    printf("Timer ID: 0x%lx\n", (long)timer_stopwatch);
    
    its.it_value.tv_sec = freq_nanosecs / GIGA;
    its.it_value.tv_nsec = freq_nanosecs % GIGA;
    its.it_interval.tv_sec = its.it_value.tv_sec;
    its.it_interval.tv_nsec = its.it_value.tv_nsec;
    
    if(timer_settime(timer_stopwatch, 0, &its, NULL) == -1) {
        perror("timer_settime");
        return -1;
    }
    
    // unblocking timer signal
    if(sigprocmask(SIG_UNBLOCK, &mask, NULL) == -1) {
        perror("sigprocmask SIG_UNBLOCK");
        return -1;
    }
    
    // Do nothing and wait for quit flag in main routine...
    while(!quit_flag) {
        if(start_flag && !clear_flag) {
            DisplayTime(&fb, nums, min, sec, msec, 300, 250);
        }
        else if(clear_flag) {
            DisplayTime(&fb, nums, 0, 0, 0, 300, 250);
            start_flag = 0;
            clear_flag = 0;
        }
    }
    
    pthread_join(thread_keyin, NULL);
    
    ReleaseBMP(bg);
    ReleaseBMP(num_fonts);
    for(i = 0; i < 11; i++) {
        ReleaseBMP(nums[i]);
    }
    return 0;
}


int fb_init(fb_dev *dev, const char *fb_name) {
    int fd, check;
    int lcd_width, lcd_height;
    struct fb_var_screeninfo st_fvs;
    struct fb_fix_screeninfo st_ffs;
    
    if((fd = open(fb_name, O_RDWR)) < 0) {
        printf("Cannot open %s\n", fb_name);
        return -1;
    }
    
    check = ioctl(fd, FBIOGET_VSCREENINFO, &st_fvs);
    if(check < 0) {
        perror("Get information error - VSCREENINFO");
        return -1;
    }
    
    check = ioctl(fd, FBIOGET_FSCREENINFO, &st_ffs);
    if(check < 0) {
        perror("Get information error - FSCREENINFO");
        return -1;
    }
    
    lcd_width = st_fvs.xres;
    lcd_height = st_fvs.yres;
    
    dev->fb_p = (unsigned char*)mmap(0, (lcd_width*lcd_height*4),
            PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);
    
    if(dev->fb_p == MAP_FAILED) {
        perror("MAP_FAILED");
        return -1;
    }
    
    dev->width = lcd_width;
    dev->height = lcd_height;
    
    return 0;
}


void *get_key(void* arg) {
    char *key = (char*)arg;
    char temp;
    
    do {
        temp = getchar();
        if(temp == '\n' || temp == '\r') continue;
        //printf("key input: %c\n", temp);
        *key = temp;

        if('A' <= temp && temp <= 'z') {
            switch(temp) {
                case 'q': // quit
                    quit_flag = 1;
                    break;
                case 's': // start
                    min = 0;
                    sec = 0;
                    msec = 0;
                    start_flag = 1;
                    break;
                case 'p': // stop
                    start_flag = 0;
                    break;
                case 'r': // resume -> actually same with `start`
                    start_flag = 1;
                    break;
                case 'c': // clear
                    min = 0;
                    sec = 0;
                    msec = 0;
                    clear_flag = 1;
                    start_flag = 1;
                    break;
            }
        }
    } while(!quit_flag);
    
    return NULL;
}


void DisplayTime(fb_dev *fb, IMAGE *fonts[], uint min, uint sec, uint msec, int x, int y) {
    const int interval = 30;
	const int alpha = 0;

	draw_bmp(fb, fonts[min/10], x, y, alpha);
	draw_bmp(fb, fonts[min%10], x+interval, y, alpha);
	draw_bmp(fb, fonts[10], x+interval*2, y, alpha);

	draw_bmp(fb, fonts[sec/10], x+interval*3, y, alpha);
	draw_bmp(fb, fonts[sec%10], x+interval*4, y, alpha);
	draw_bmp(fb, fonts[10], x+interval*5, y, alpha);

	draw_bmp(fb, fonts[msec/10], x+interval*6, y, alpha);
	draw_bmp(fb, fonts[msec%10], x+interval*7, y, alpha);
}


static void timer_action(int sig, siginfo_t *si, void *uc) {
    if(start_flag && !clear_flag) {
        if(++msec >= 100) {
            msec = 0;
            sec++;
        }
        if(sec >= 60) {
            sec = 0;
            min++;
        }
        if(min >= 100) {
            min = 0;
        }
    }
}
