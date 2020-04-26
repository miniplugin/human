#include <stdlib.h> 
#include <unistd.h> 
#include <stdio.h> 
#include <signal.h> 
#include <time.h> 
#include <math.h>
#define CLOCKID CLOCK_REALTIME 
#define SIG SIGRTMIN 
#define errExit(msg) do { \
			perror(msg); exit(EXIT_FAILURE); \
		} while (0)
#include <linux/input.h>
#include <string.h>
#include <sys/types.h>
#include <fcntl.h>                    

//frame buffer
#include <sys/ioctl.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <pthread.h>

#include "gstub.h"
#define POS_DEBUG

float vd = 0, v = 0;
float x=0,x1=700,x2=0,y=480;

//#define g 9.8
//#define theta 3.14/6
//#define h 0.0001

int fb_init(fb_dev *dev, const char *fb_name);

	int i=0;

typedef unsigned short int U32;
unsigned int* pfbdata;
unsigned int makepixel(U32 r, U32 g, U32 b){
	unsigned long int reval;
	reval = b;
	reval |=((unsigned long)g<<8);
	reval |=((unsigned long)r<<16);
	return reval;
}

struct fb_var_screeninfo fvs;
int frameBufferInit(void){
    int frame_fd;
    int check;
    if((frame_fd = open("/dev/fb0",O_RDWR))<0) {
        return -1;       
    }   
    if((check=ioctl(frame_fd,FBIOGET_VSCREENINFO,&fvs))<0) {
        perror("Get Information Error - VSCREENINFO!");
        exit(1);
    }
 
    if(fvs.bits_per_pixel != 32) {
        perror("Unsupport Mode. 32Bpp Only.");
        exit(1);
    }
 
    if(lseek(frame_fd, 0, SEEK_SET) < 0) {  // Set Pixel Map
        perror("LSeek Error.");
        exit(1);
    }
    pfbdata = (unsigned int*)mmap(0,fvs.xres*fvs.yres*32/8,PROT_READ|PROT_WRITE,MAP_SHARED,frame_fd,0);
    if((unsigned int)pfbdata ==(unsigned int)-1){
	perror("Error Mapping!\n");
    }
    return frame_fd; 
}

int makeRect(int frame_fd,U32 R,U32 G,U32 B,int posx1,int posy1){
	unsigned int pixel;
	int offset;
	int repx, repy;

	pixel=makepixel(R,G,B);
/*	
	for(repy=posy1; repy < posy2; repy++) {
        	offset = repy * fvs.xres * (32/8) + posx1 * (32/8);
       		if(lseek(frame_fd, offset, SEEK_SET) < 0) {
            	perror("LSeek Error!");
            	exit(1);
        }
        	for(repx = posx1; repx <= posx2; repx++)
            		write(frame_fd, &pixel,(32/8));
    	}
*/
	for(repy=posy1;repy<=posy1+30;repy++){
		offset = repy * fvs.xres;
		for(repx=posx1;repx<=posx1+30;repx++)
			*(pfbdata+offset+repx) =pixel;//0xFF0000;// pixel;

	}
	return 0;
}


	
	

int fb_init(fb_dev *dev, const char *fb_name)
{
	int fd;

	if(( fd = open(fb_name, O_RDWR)) < 0 ) 
	{
		return -1;
	}

	dev->fb_p = (unsigned int*)mmap(0, (LCD_WIDTH*LCD_HEIGHT*4),
		PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	close(fd);
	if(dev->fb_p == MAP_FAILED)
	{
		return -1;
	}

	dev->width = LCD_WIDTH;
	dev->height = LCD_HEIGHT;

	return 0;
}
int frame_fd;

static void handler(int sig, siginfo_t *si, void *uc) 
{ 
makeRect(frame_fd,0,0,0,x,y);
	
	if(x>350){
	
	vd=vd+9.8*0.259*0.01;
	v=v+vd*0.01; y=0.268*abs(x);}

	 else{
	
	vd=vd-9.8*0.259*0.01;
	v=v+vd*0.01; x2=700-x;  y=0.268*abs(x2);}

	
	
	x=x1-v*0.966;
	

	makeRect(frame_fd,255,0,0,x,y);
	printf("x position: %f, y position: %f\n",x,y);
	
	
  

} 

int main(int argc, char *argv[]) 
{ 
	timer_t timerid; 
	struct sigevent sev; 
	struct itimerspec its; 
	long long freq_nanosecs; 
	sigset_t mask; 
	struct sigaction sa; 
	

	fb_dev fb;
	

if(fb_init(&fb, "/dev/fb0") < 0)
	{
		perror("can't init fb\n");
		return -1;
	}

frame_fd = frameBufferInit();
/* Establish handler for timer signal */ 

printf("Establishing handler for signal %d\n", SIG); 
sa.sa_flags = SA_SIGINFO; 
sa.sa_sigaction = handler; 
sigemptyset(&sa.sa_mask); 
if (sigaction(SIG, &sa, NULL) == -1) 
	errExit("sigaction"); 

/* Block timer signal temporarily */ 
printf("Blocking signal %d\n", SIG); 
sigemptyset(&mask); 
sigaddset(&mask, SIG); 
if (sigprocmask(SIG_SETMASK, &mask, NULL) == -1) 	errExit("sigprocmask"); 

/* Create the timer */ 
sev.sigev_notify = SIGEV_SIGNAL; 
sev.sigev_signo = SIG; 
sev.sigev_value.sival_ptr = &timerid; 
if (timer_create(CLOCKID, &sev, &timerid) == -1) 	errExit("timer_create"); 
printf("timer ID is 0x%lx\n", (long) timerid); 

/* Start the timer */ 
freq_nanosecs = atoll(argv[1]); 
its.it_value.tv_sec = freq_nanosecs / 1000000000; its.it_value.tv_nsec = freq_nanosecs % 1000000000; its.it_interval.tv_sec = its.it_value.tv_sec; 
its.it_interval.tv_nsec = its.it_value.tv_nsec; 

if (timer_settime(timerid, 0, &its, NULL) == -1) errExit("timer_settime"); 



/* Unlock the timer signal, so that timer notification can be delivered */ 

printf("Unblocking signal %d\n", SIG); 

if (sigprocmask(SIG_UNBLOCK, &mask, NULL) == -1) 	errExit("sigprocmask"); 

while(1);

close(frame_fd);
munmap(pfbdata,fvs.xres*fvs.yres*32/8);
} 
