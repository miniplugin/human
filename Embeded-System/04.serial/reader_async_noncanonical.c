/*
`reader_async.c`에서 serial 데이터를 읽는 부분을 signal handler 안에서 처리하도록 수정하였습니다.

테스트 성공
sudo ./a.out
Start listening...
receive SIGIO signal.
:aefawef
:8
receive SIGIO signal.
:fwaf
:5
*/

#include <sys/signal.h>
//#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>

#define BAUDRATE B38400

#define MODEDEVICE "/dev/ttyUSB0"
#define _POSIX_SOURCE 1
#define TRUE 1
#define FALSE 0

volatile int STOP = FALSE;

void signal_handler_IO(int status);

int fd;

int main() {
    int c;
    struct termios oldtio, newtio;
    struct sigaction saio;
    
    fd = open(MODEDEVICE, O_RDWR | O_NOCTTY | O_NONBLOCK);
    if(fd < 0) {
        perror(MODEDEVICE);
        return -1;
    }
    
    saio.sa_handler = signal_handler_IO; // 신호가 왔을 때 수행하는 routine 함수.
    sigemptyset(&saio.sa_mask); // saio.sa_mask = 0;
    saio.sa_flags = 0;
    saio.sa_restorer = NULL;
    // IO신호가 들어오면 아무 것도 하지 말라는 뜻?
    sigaction(SIGIO, &saio, NULL); 
    
    fcntl(fd, F_SETOWN, getpid()); // Allow process to detect SIGIO
    // FASYNC, FNDELAY나 O_ASYNC, O_NONBLOCK은 값이 같음
    //fcntl(fd, F_SETFL, FASYNC); // make async
    //fcntl(fd, F_SETFL, FNDELAY); // (addition)non blocking reads.
    fcntl(fd, F_SETFL, O_ASYNC|O_NONBLOCK);
    
    tcgetattr(fd, &oldtio); // old 설정을 꺼내온다.
    bzero(&newtio, sizeof(newtio)); // = memset
    newtio.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;
    newtio.c_iflag = IGNPAR; // ignore parity
    newtio.c_oflag = 0;
    newtio.c_lflag = 0; // noncanonnical mode
    
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
    
    cfsetspeed(&newtio, BAUDRATE);
    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &newtio); // new 설정을 입력
    
    printf("Start listening...\n");

    STOP = FALSE;
    while(STOP == FALSE) {
        sleep(1);
    }
    tcsetattr(fd, TCSANOW, &oldtio); // 기존 설정으로 복귀
}

void signal_handler_IO(int status) {
    int res;
    char buf[256];
    res = read(fd, buf, 255);
    if(res <= 2 && buf[0] == 'z') STOP = TRUE;
    else {
        printf(":%c:%d\n", buf[0], res);
    }
}
