#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <unistd.h>
#include <pthread.h>
#include <signal.h>

#include "gstub.c"

typedef struct my_time {
	unsigned int msec;
	unsigned int sec;
	unsigned int min;
} my_time;

typedef unsigned int uint;

int fb_init(fb_dev *dev, const char *fb_name);
void* get_key(void* arg);
void DisplayTime(fb_dev *fb, IMAGE *fonts[], uint min, uint sec, uint msec, int x, int y);
void sig_handler_interrupt(int signo);

IMAGE *bg, *num_fonts, *num[11];

int main(int argc, char* argv[]) {
	int i, stop, dev;
	fb_dev fb;

	my_time curr_time, prev_time;
	pthread_t thread;
	char key = 0;
	unsigned int freq;
	unsigned int min = 0, sec = 0, msec = 0;
	unsigned int temp[3];
	unsigned int prev_mmsec, curr_mmsec;
	unsigned char state = 0;

	if(fb_init(&fb, "/dev/fb0") < 0) {
		perror("can't init fb\n");
		return -1;
	}

	// 그림 파일 읽기
	if(argc < 2) {
		bg = ReadBMP("./bg2.bmp", 0);
	}
	else {
		bg = ReadBMP(argv[1], 0);
	}
	if(bg < 0) {
		printf("File open fail.\r\n");
		return 0;
	}
	
	num_fonts = ReadBMP("num_fonts.bmp", 0);

	// 그림 글자 폰트 분할
	SeparateFonts(num_fonts, num, 23, 40, 11);

	// 배경화면 그리기
	draw_bmp(&fb, bg, 0,0, 0);
	
	// 시그널 처리
	signal(SIGINT, (void*)sig_handler_interrupt);
	
	// 시간 표시
	while(1) {
		DisplayTime(&fb, num, min, sec, msec, 300, 250);
		usleep(10000);
		msec++;
		if(msec >= 100) {sec++; msec = 0;}
		if(sec >= 60) {min++; sec = 0;}
		if(min >= 60) {min = 0;}
	}
	
	return 0;
}

int fb_init(fb_dev *dev, const char *fb_name) {
	int fd;

	if((fd = open(fb_name, O_RDWR)) < 0) {
		return -1;
	}

	dev->fb_p = (unsigned char*)mmap(0, (LCD_WIDTH*LCD_HEIGHT*4),
			PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	close(fd);
	if(dev->fb_p == MAP_FAILED) {
		return -1;
	}

	dev->width = LCD_WIDTH;
	dev->height = LCD_HEIGHT;

	return 0;
}

void* get_key(void* arg) {
	char *key = (char*)arg;
	char tmp;

	do {
		tmp = getchar();
		if('A' <= tmp && tmp <= 'z') {
			*key = tmp;
		}
	} while(*key != 'q');

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
	draw_bmp(fb, fonts[10], x+interval*5, y, alpha );

	draw_bmp(fb, fonts[msec/10], x+interval*6, y, alpha);
	draw_bmp(fb, fonts[msec%10], x+interval*7, y, alpha);
}

void sig_handler_interrupt(int signo) {
	int i;
	
	printf("sighandler");
	
	// 그림 파일 메모리 해제
	ReleaseBMP(bg);
	ReleaseBMP(num_fonts);
	for(i = 0; i < 11; i++)
		ReleaseBMP(num[i]);
}
