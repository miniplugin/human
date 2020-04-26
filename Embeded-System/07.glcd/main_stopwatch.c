#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <unistd.h>
#include <pthread.h>

#include "gstub.c"

typedef unsigned int uint;

int fb_init(fb_dev *dev, const char *fb_name);
void* get_key(void* arg);
void DisplayTime(fb_dev *fb, IMAGE *fonts[],uint  min, uint sec, uint msec, int x, int y);

int main(int argc, char* argv[])
{
	int i;
	fb_dev fb;
	IMAGE *bg, *num_fonts, *num[11];

	pthread_t thread;
	char key = 0;
	uint min = 0, sec = 0, msec = 0;
	struct timeval prev_time, current_time;
	unsigned char state = 0;

	if(fb_init(&fb, "/dev/fb0") < 0)
	{
		perror("can't init fb\n");
		return -1;
	}
	
	// 그림 파일 읽기
	if(argc < 2) bg = ReadBMP("./bg2.bmp", 0);
	else bg = ReadBMP(argv[1], 0);
	if(bg < 0) {
		printf("File open fail.\r\n");
		return 0;
	}
	
	num_fonts = ReadBMP("./num_fonts.bmp", 0);

	// 그림 글자 폰트 분할
	SeparateFonts(num_fonts, num, 23, 40, 11);

	// 배경화면 그리기
	draw_bmp(&fb, bg, 0,0, 0);
	// 시간 표시 00:00:00
	DisplayTime(&fb, num, 0, 0, 0, 300, 250);

	// 키보드 입력 쓰레드 생성
	pthread_create(&thread, NULL, get_key, &key);

	// while문에 들어가기전 prev_time, current_time 구조체를 현재시간으로 초기화해준다.
	gettimeofday(&prev_time, NULL);
	current_time.tv_sec = prev_time.tv_sec;
	current_time.tv_usec = prev_time.tv_usec;
	
	while(1) {
		// 현재 구해진 시간과 이전 시간의 차이를 이용해서 시간이 흐른 정도를 계산한다.
		//gettimeofday(&current_time, NULL);
		sec = (uint)((current_time.tv_sec - prev_time.tv_sec));
		msec = (uint)((current_time.tv_usec - prev_time.tv_usec)/10000);
		// timeval 구조체에는 sec과 usec만이 존재하며, 서로의 차를 통해 분을 계산해야 한다.
		msec = msec%100; 
		min = sec/60;
		min = min%100;
		sec = sec%60;

		// 구한 각각의 시간을 DisplayTime 함수를 이용해서 LCD화면에 출력한다.
		DisplayTime(&fb, num, min, sec, msec, 300, 250);
		// 10ms(=10,000ns)동안 대기
		usleep(10000);

		switch(key){
			case 's':
				// s가 입력되면 스탑워치가 작동하며, 계속해서 현재시간을 갱신시킨다.
				gettimeofday(&current_time, NULL);
				break;
			case 'c':
				// c가 입력되면 시간을 0으로 초기화하고 작동을 멈춘다.
				min = 0;
				break;
			default:
				// 아무 키가 입력되기 전 스탑워치는 멈충 상태이다.
				//gettimeofday(&current_time, NULL);
				//prev_time.tv_sec = current_time.tv_sec;
				//prev_time.tv_usec = current_time.tv_usec;
				break;
		}
		if(key == 'q') {
			// q가 입력되면 while문을 빠져나와 프로그램이 종료된다.
			break;
		}
	}

	pthread_join(thread, NULL);

	ReleaseBMP(bg);
	ReleaseBMP(num_fonts);
	for(i = 0; i < 11; i++)
		ReleaseBMP(num[i]);
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
		if('A' <= tmp && tmp <= 'z') *key = tmp;
	} while(*key != 'q');

	return NULL;
}

void DisplayTime(fb_dev *fb, IMAGE *fonts[], uint  min, uint sec, uint msec, int x, int y) {
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
