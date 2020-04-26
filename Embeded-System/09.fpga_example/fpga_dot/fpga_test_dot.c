/* FPGA DotMatirx Test Application
File : fpga_test_dot.c*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


#include "./fpga_dot_font.h"

#define FPGA_DOT_DEVICE "/dev/fpga_dot"

int main(int argc, char **argv)
{
	int i;
	int dev;
	int str_size;
	int set_num;
	
	if(argc!=2) {
		printf("please input the parameter! \n");
		printf("ex)./fpga_dot_test 7\n");
		return -1;
	}

	set_num = atoi(argv[1]);
	if(set_num<0||set_num>9) {
		printf("Invalid Numner (0~9) !\n");
		return -1;
	}

	dev = open(FPGA_DOT_DEVICE, O_WRONLY);
	if (dev<0) {
		printf("Device open error : %s\n",FPGA_DOT_DEVICE);
		exit(1);
	}
	
	str_size=sizeof(fpga_number[set_num]);

    /*
	write(dev,fpga_set_full,sizeof(fpga_set_full));
	sleep(1);

	write(dev,fpga_set_blank,sizeof(fpga_set_blank));
	sleep(1);
    */

	write(dev,fpga_number[set_num],str_size);	


	close(dev);
	
	return 0;
}
