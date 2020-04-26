/* FPGA DIP Switch Test Application
File : fpga_test_dip.c*/

#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h> 
#include <sys/ioctl.h>
#include <signal.h>

unsigned char quit = 0;

void user_signal1(int sig) 
{
	quit = 1;
}

int main(void)
{
	int dev;
	unsigned char dip_sw_buff = 0;  

	dev = open("/dev/fpga_dip_switch", O_RDWR);

	if (dev<0){
		printf("Device Open Error\n");
		close(dev);
		return -1;
	}

	(void)signal(SIGINT, user_signal1);

	printf("Press <ctrl+c> to quit. \n");
	while(!quit){
		usleep(400000);
		read(dev, &dip_sw_buff, 1);
		printf("Read dip switch: 0x%02X \n", dip_sw_buff);
	}
	close(dev);
}
