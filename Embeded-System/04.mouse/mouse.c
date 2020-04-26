/*
`/dev/input/event{N}`에서 마우스 이벤트 신호를 받아들여서 출력하는 프로그램.
*/

#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <linux/input.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <fcntl.h> // O_RDWR, O_NOCTTY

#define KEYBOARD_DEVICE "/dev/input/event3"
#define MOUSE_DEVICE "/dev/input/event5" // 자기자신의 마우스 이벤트 번호를 찾아서 바꿔줘야함

typedef struct input_event input_event_t;

int main() {
    int fd;
    input_event_t buf;
    memset(&buf, 0, sizeof(input_event_t));
    
    fd = open(MOUSE_DEVICE, O_RDWR|O_NOCTTY|O_NONBLOCK);
    if(0 > fd) {
        printf("open error\n");
        return -1;
    }
    
    while(1) {
        read(fd, &buf, sizeof(input_event_t));
        switch(buf.code) {
            case BTN_LEFT:
                printf("Left button clicked\n");
                break;
            case BTN_RIGHT:
                printf("Right button clicked\n");
                break;
            case REL_X:
                if(buf.value) printf("Mouse move X: %d\n", buf.value);
                break;
            case REL_Y:
                if(buf.value) printf("Mouse move Y: %d\n", buf.value);
                break;
            default:
                break;
        }
        /*
        if(buf.type | buf.code | buf.value) {
            printf("mouse read type: %x, code: %x, value: %x\n", buf.type, buf.code, buf.value);
        }
        */
    }
    close(fd);
    return 0;
}
