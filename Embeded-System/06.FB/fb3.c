#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

#define LCD_WIDTH (800)
#define LCD_HEIGHT (480)
//#define LCD_WIDTH (1920)
//#define LCD_HEIGHT (1080)

typedef struct {
    int fb_p;
    int width;
    int height;
} fb_dev;

typedef unsigned int uint;


int fb_init(fb_dev *dev, const char *fb_name);
unsigned short rgb888to565(unsigned char r, unsigned char g, unsigned char b);


int main(int argc, char* argv[]) {
    int i;
    fb_dev fb;
    if(fb_init(&fb, "/dev/fb0") < 0) {
        perror("can't init fb\n");
        return -1;
    }
    for(i = 0; i < LCD_WIDTH*LCD_HEIGHT*2; i++) {
        ((unsigned short*)(fb.fb_p))[i] = rgb888to565(0, 255, 0);
    }
}


unsigned short rgb888to565(unsigned char r, unsigned char g, unsigned char b) {
    unsigned short temp;
    temp = b >> 3;
    temp |= (g >> 2) << 5;
    temp |= (r >> 3) << 11;
    return temp;
}


int fb_init(fb_dev *dev, const char *fb_name) {
    int fd;
    if((fd = open(fb_name, O_RDWR)) < 0) {
        return -1;
    }
    dev->fb_p = (unsigned short*)mmap(0, (LCD_WIDTH*LCD_HEIGHT*4),
                        PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);
    if(dev->fb_p == MAP_FAILED) {
        return -1;
    }
    dev->width = LCD_WIDTH;
    dev->height = LCD_HEIGHT;
    return 0;
}
