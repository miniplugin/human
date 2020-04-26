/* FPGA Push Switch Test Application
File : fpga_test_push.c*/

#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h> 
#include <sys/ioctl.h>
#include <signal.h>

#define MAX_BUTTON 9

unsigned char quit = 0;

void user_signal1(int sig) 
{
	quit = 1;
}

int main(void)
{
	int i;
	int dev;
	int buff_size;

	unsigned char push_sw_buff[MAX_BUTTON];

	dev = open("/dev/fpga_push_switch", O_RDWR);

	if (dev<0){
		printf("Device Open Error\n");
		close(dev);
		return -1;
	}

	(void)signal(SIGINT, user_signal1);

	buff_size=sizeof(push_sw_buff);
	printf("Press <ctrl+c> to quit. \n");
	while(!quit){
		usleep(400000);
		read(dev, &push_sw_buff, buff_size);

		for(i=0;i<MAX_BUTTON;i++) {
			printf("[%d] ",push_sw_buff[i]);
		}
		printf("\n");
	}
	close(dev);
}
