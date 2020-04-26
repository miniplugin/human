#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define MOTOR_ATTRIBUTE_ERROR_RANGE 4
#define FPGA_STEP_MOTOR_DEVICE "/dev/fpga_step_motor"

void usage(char* dev_info); 

int main(int argc, char **argv)
{
	int i;
	int dev;
	int str_size;

	int motor_action;
	int motor_direction;
	int motor_speed;


	unsigned char motor_state[3];
	
	memset(motor_state,0,sizeof(motor_state));

	if(argc!=4) {
		printf("Please input the parameter! \n");
		usage(argv[0]);
		return -1;
	}

	motor_action = atoi(argv[1]);
	if(motor_action<0||motor_action>1) {
		printf("Invalid motor action!\n");
		usage(argv[0]);
		return -1;
	}
	
	motor_direction = atoi(argv[2]);
	if(motor_direction<0||motor_direction>1) {
		printf("Invalid motor direction!\n");
		usage(argv[0]);
		return -1;
	}
	
	motor_speed = atoi(argv[3]);
	if(motor_speed<0||motor_speed>255) {
		printf("Invalid motor speed!\n");
		usage(argv[0]);
		return -1;
	}
	
	motor_state[0]=(unsigned char)motor_action;
	motor_state[1]=(unsigned char)motor_direction;;
	motor_state[2]=(unsigned char)motor_speed;

	dev = open(FPGA_STEP_MOTOR_DEVICE, O_WRONLY);
	if (dev<0) {
		printf("Device open error : %s\n",FPGA_STEP_MOTOR_DEVICE);
		exit(1);
	}
	
	write(dev,motor_state,3);	

	close(dev);
	
	return 0;
}


void usage(char* dev_info) 
{
	printf("<Usage> %s [Motor Action] [Motor Diretion] [Speed]\n",dev_info);
	printf("Motor Action : 0 - Stop / 1 - Start\n");
	printf("Motor Direction : 0 - Left / 1 - Right\n");
	printf("Motor Speed : 0(Fast) ~ 250(Slow)\n");
	printf("ex) %s 1 0 10\n",dev_info);
}

