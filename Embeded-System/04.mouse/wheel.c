#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#define RESET 0xFF
#define GET_ID 0xF2
#define SET_SAMPLERATE 0xF3
#define ACK 0xFA

// 주어진 디바이스(fd)에 내용 입력.
int setCmd(int fd, unsigned char* command, int size) {
    int index;
    for (index = 0; index < size; index++) {
        int length = write(fd, command + index, sizeof(unsigned char)); 
        if (length <= 0) {
            perror("[setCmd] failed to write");
            return -1;
        }
        
        unsigned char ack;
        length = read(fd, &ack, sizeof(unsigned char));
        printf("[setCmd] length: %d ack: 0x%X\n", length, ack);
        if (ack != ACK) {
            puts("[setCmd] invalid ack!!");
            return -1;
        }
    }
    return 0;
}

// id가 0x00 - 기본 마우스
// id가 0x03 - 휠 지원 마우스
int getId(int fd) {
    unsigned char cmd = GET_ID;
    unsigned char rcv[2];
    write(fd, &cmd, 1);
    int length = read(fd, rcv, 2);
    printf("[getId] length: %d ack: 0x%X id: 0x%X\n", length, rcv[0], rcv[1]);
    if (rcv[0] != ACK) return -1;
    else return rcv[1];
}

int main(int argc, char* argv[])
{
    if (argc != 2) {
        puts("[usage] ./a.out /device/file"); // /dev/input/mouse0
        return -1;
    }
    int fd = open(argv[1], O_RDWR);
    if (fd == -1) {
        perror("failed to open: ");
        return -1;
    } else {
        printf("%s opened\n", argv[1]);
    }
    
    unsigned char imps2Init[] = {SET_SAMPLERATE, 200, SET_SAMPLERATE, 100, SET_SAMPLERATE, 80};
    setCmd(fd, imps2Init, sizeof(imps2Init));
    int mouseId = getId(fd);
    char low[4] = {0, }; // low를 struct input_event로 받은게 아니라 배열로 받은 것.
    int length = 0;
    while(1) {
        length = read(fd, low, 4);
        if (length <= 0) {
            perror("failed to read: ");
            return -1;
        }
        printf("read length: %d\n", length);
        char buttons = low[0] & 0x03;
        printf("[Buttons] left: %s right: %s\n", buttons & 0x01 ? "clicked" : "", buttons & 0x02 ? "clicked" : "");
        printf("[x] low[1]: %d 0x%X\n", low[1], low[1]);
        printf("[y] low[2]: %d 0x%X\n", low[2], low[2]);
        printf("[z] low[2]: %d 0x%X\n", low[3], low[3]);
    }
    return 0;
}
