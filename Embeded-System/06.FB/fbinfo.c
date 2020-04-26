/* Filename : fbinfo.c */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/fb.h> // Frame Buffer API


int main(int argc, char** argv)
{
    int check;
    int frame_fd;
    struct fb_var_screeninfo st_fvs; // 프레임버퍼의 가변 정보
    struct fb_fix_screeninfo st_ffs; // 프레임버퍼의 고정 정보
    
    frame_fd = open("/dev/fb0", O_RDWR);
    if(frame_fd < 0) {
        perror("Frame Buffer Open Error!");
        return 1;
    }
    
    // ioctl: 파일의 기본 동작(read/write)외에 다른 기능이 필요할 때 사용한다.
    check = ioctl(frame_fd, FBIOGET_VSCREENINFO, &st_fvs);
    if(check < 0) {
        perror("Get Information Error - VSCREENINFO!");
        return 1;
    }
    
    check = ioctl(frame_fd,FBIOGET_FSCREENINFO, &st_ffs);
    if(check < 0) {
        perror("Get Information Error - FSCREENINFO!");
        return 1;
    }

    system("clear");
    printf("==================\n");
    printf("Frame Buffer Info\n");
    printf("------------------\n");
    printf("X - res : %d\n", st_fvs.xres);
    printf("Y - res : %d\n", st_fvs.yres);
    printf("X - v_res : %d\n", st_fvs.xres_virtual);
    printf("Y - v_res : %d\n", st_fvs.yres_virtual);
    printf("Bit/Pixel : %d\n", st_fvs.bits_per_pixel);
    printf("------------------\n");
    printf("Buff Size : %d\n", st_ffs.smem_len);
    printf("==================\n");
    close(frame_fd);
}
