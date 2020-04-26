/* FPGA Text LCD Test Application
File : fpga_test_text_lcd.c*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define MAX_BUFF 32
#define LINE_BUFF 16
#define FPGA_TEXT_LCD_DEVICE "/dev/fpga_text_lcd"

int main(int argc, char **argv)
{
	int i;
	int dev;
	int str_size;
	int chk_size;
	
	unsigned char string[32];

	memset(string,0,sizeof(string));	

	if(argc!=3 || strlen(argv[1])<1 || strlen(argv[2])<1)
	{
		printf("Usage: sudo ./fpga_test_text_lcd abc 123\n");
		return -1;
	}

	if(strlen(argv[1])>LINE_BUFF||strlen(argv[2])>LINE_BUFF)
	{
		printf("16 alphanumeric characters on a line!\n");
		return -1;
	}
		
	dev = open(FPGA_TEXT_LCD_DEVICE, O_WRONLY);
	if (dev<0) {
		printf("Device open error : %s\n",FPGA_TEXT_LCD_DEVICE);
		return -1;
	}

	str_size=strlen(argv[1]);
	if(str_size>0) {
		strncat(string,argv[1],str_size);
		memset(string+str_size,' ',LINE_BUFF-str_size);
	}

	str_size=strlen(argv[2]);
	if(str_size>0) {
		strncat(string,argv[2],str_size);
		memset(string+LINE_BUFF+str_size,' ',LINE_BUFF-str_size);
	}

	write(dev,string,MAX_BUFF);	
	
	close(dev);
	
	return(0);
}
