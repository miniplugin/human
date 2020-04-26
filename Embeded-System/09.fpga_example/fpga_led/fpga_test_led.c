/* FPGA LED Test Application
File : fpga_test_led.c*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define LED_DEVICE "/dev/fpga_led"

int main(int argc, char **argv) {
	int dev;
	unsigned char data;
	unsigned char retval;

	if(argc!=2) {
		printf("please input the parameter! \n");
		printf("ex)./test_led 7 (0~255)\n");
		return -1;
	}

	data = atoi(argv[1]);
	if((data<0)||(data>0xff)) {
		printf("Invalid range!\n");
        exit(1);
    }

    dev = open(LED_DEVICE, O_RDWR);
    if (dev<0) {
        printf("Device open error : %s\n", LED_DEVICE);
        exit(1);
    }

    retval = write(dev, &data, 1);	
    if(retval < 0) {
        printf("Write Error!\n");
        return -1;
    }

    sleep(1);

    data = 0;
    retval = read(dev, &data,1);
    if(retval < 0) {
        printf("Read Error!\n");
        return -1;
    }
    printf("Current LED Value : 0x%x\n", data);
    printf("\n");
    close(dev);

    return(0);
}
