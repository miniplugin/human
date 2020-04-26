#include <linux/input.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>                    

//frame buffer
#include <sys/ioctl.h>
#include <linux/fb.h>
#include <sys/mman.h>

//#define POS_DEBUG
#define DEVICE_FRAME_BUFFER "/dev/fb0"
#define DEVICE_MOUSE "/dev/input/mouse1"
#define INTERVAL_U 10000

typedef unsigned short int U32;

struct fb_var_screeninfo fvs;
unsigned int *pfbdata; // /dev/fb0 mapped
typedef struct input_event input_event_t;


unsigned int makepixel(U32 r, U32 g, U32 b) {
	unsigned int reval;
	reval = b;
	reval |= ((unsigned long)g<<8);
	reval |= ((unsigned long)r<<16);
	return reval;
}

int frameBufferInit(void) {
    int frame_fd;
    int check;

    if((frame_fd = open(DEVICE_FRAME_BUFFER, O_RDWR)) < 0) {
        return -1;
    }   
    if((check = ioctl(frame_fd, FBIOGET_VSCREENINFO, &fvs)) < 0) {
        perror("Get Information Error - VSCREENINFO!\n");
        exit(1);
    }
    if(fvs.bits_per_pixel != 32) {
        perror("Unsupport Mode. 32Bpp Only.\n");
        exit(1);
    }
    if(lseek(frame_fd, 0, SEEK_SET) < 0) {  // Set Pixel Map
        perror("LSeek Error.\n");
        exit(1);
    }
	
    pfbdata = (unsigned int*)mmap(0, fvs.xres*fvs.yres*32/8, PROT_READ|PROT_WRITE, MAP_SHARED, frame_fd, 0);
    return frame_fd;
}

int makeRect(int frame_fd, U32 R, U32 G, U32 B, int posx1, int posx2, int posy1, int posy2) {
	unsigned int pixel;
	int offset;
	int repx, repy;

	pixel = makepixel(R, G, B);
	for(repy = posy1; repy <= posy2; repy++){
		offset = repy * fvs.xres;
		for(repx = posx1; repx <= posx2; repx++) {
			pfbdata[offset+repx] = pixel;
		}
	}
	return 0;
}

/* void clearScreen() {
	int x, y;
	unsigned int color = makepixel(0, 0, 0);
	for(y = 0; y < fvs.yres; y++) {
		for(x = 0; x < fvs.xres; x++) {
			pfbdata[y*fvs.xres+x] = color;
		}
	}
} */

int main() {        
	int fd, frame_fd;
	int mouseR = 0xFF;
	int mouseG = 0xFF;
	int mouseB = 0xFF;
	int color = 0;
	
	unsigned char *ptr;
	unsigned char btn, bLeft, bRight, bMiddle;
	int posX, posY;
	int posX_, posY_;
	int abposX, abposY;
	printf("%d, %d\n", abposX, abposY);
	
	int i;
	unsigned int pixel;
	
	input_event_t buf;
	memset(&buf, 0, sizeof(input_event_t));      
	
	// open frame buffer
	frame_fd = frameBufferInit();
	if(frame_fd < 0) {
		perror("FrameBuffer error\n");
		return -1;
	}
	
	// open mouse device
	fd = open(DEVICE_MOUSE, O_RDONLY);
	if(fd < 0) {
		perror("open error\n");
		return -1;
	}
	
	// initialize screen
	abposX = fvs.xres/2;
	abposY = fvs.yres/2;
	makeRect(frame_fd, 0, 0, 0, 0, fvs.xres-1, 0, fvs.yres-1);
	
	while(1) {
		ptr = (unsigned char*)&buf;
		
		// load mouse data
		read(fd, &buf, sizeof(input_event_t));
		btn = ptr[0] & 0x03;
		bLeft = btn & 0x1;
		bRight = (btn & 0x2) > 0;
		bMiddle = (btn & 0x4) > 0;
		posX = (char)ptr[1];
		posY = (char)ptr[2];
		if(posX > 0x7F) posX -= 0x100;
		if(posY > 0x7F) posY -= 0x100;
		
		//pixel = pfbdata[abposY*fvs.xres + abposX];
		
		// mouse click
		if(bLeft) {
			switch(color) {
				case 0:
					if((mouseR += 25) > 0xFF) mouseR = 0x00;
					printf("hi%d\n", mouseR);
					break;
				case 1:
					if((mouseG += 25) > 0xFF) mouseG = 0x00;
					printf("hi%d\n", mouseG);
					break;
				case 2:
					if((mouseB += 25) > 0xFF) mouseB = 0x00;
					printf("hi%d\n", mouseB);
					break;
			}
		} else if(bRight) {
			if(++color > 2) color = 0;
		}
		
		abposX += posX;
		abposY -= posY;
		if(abposX < 0) abposX = 0;
		if(abposY < 0) abposY = 0;
		if(abposX >= fvs.xres-10) abposX = fvs.xres-11;
		if(abposY >= fvs.yres-10) abposY = fvs.yres-11;
		printf("(%d,%d) - (%d,%d)\n", abposX, abposY, posX, posY);
		makeRect(frame_fd, mouseR, mouseG, mouseB, abposX, abposX+10, abposY, abposY+10);
		
		// remember last mouse data
		posX_ = posX;
		posY_ = posY;
		usleep(INTERVAL_U);
	}
	
	close(fd);
	close(frame_fd);
	munmap(&buf, sizeof(input_event_t));
	munmap(pfbdata, fvs.xres*fvs.yres*32/8);
	return 0;
}
