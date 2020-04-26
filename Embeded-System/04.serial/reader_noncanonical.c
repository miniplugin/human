#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>

#define BAUDRATE B38400

#define MODEDEVIDE "/dev/ttyS1"
#define _POSIX_SOURCE 1
#define TRUE 1
#define FALSE 0

volatile int STOP = FALSE;

int main() {
    int fd, c, res;
    struct termios oldtio, newtio;
    char buf[255];
    
    fd = open(MODEDEVIDE, O_RDWR | O_NOCTTY);
    if(fd < 0) {
        perror(MODEDEVIDE);
        return -1;
    }
    
    tcgetattr(fd, &oldtio); // old 설정을 꺼내온다.
    bzero(&newtio, sizeof(newtio));
    newtio.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;
    newtio.c_iflag = IGNPAR | ICRNL;
    newtio.c_oflag = 0;
    newtio.c_lflag = 0; // NON-Canonical mode == raw mode?
    
    newtio.c_cc[VINTR] = 0;
    newtio.c_cc[VQUIT] = 0;
    newtio.c_cc[VERASE] = 0;
    newtio.c_cc[VKILL] = 0;
    newtio.c_cc[VEOF] = 4;
    newtio.c_cc[VTIME] = 0;
    newtio.c_cc[VMIN] = 1; // blocking read until 1 character arrives
    newtio.c_cc[VSWTC] = 0;
    newtio.c_cc[VSTART] = 0;
    newtio.c_cc[VSTOP] = 0;
    newtio.c_cc[VSUSP] = 0;
    newtio.c_cc[VEOL] = 0;
    newtio.c_cc[VREPRINT] = 0;
    newtio.c_cc[VDISCARD] = 0;
    newtio.c_cc[VWERASE] = 0;
    newtio.c_cc[VLNEXT] = 0;
    newtio.c_cc[VEOL2] = 0;
    
    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &newtio); // new 설정을 입력
    
    while(1) {
        res = read(fd, buf, 255);
        if(res > 0) {
            buf[res] = 0;
            printf(":%s:%d\n", buf, res);
            if(buf[0] == 'z') break;
        }
    }
    tcsetattr(fd, TCSANOW, &oldtio); // 기존 설정으로 복귀
}
