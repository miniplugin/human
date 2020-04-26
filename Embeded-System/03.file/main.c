/*
int open(char *filename, int access, int permission);
// access: open mode.
// O_RDONLY, O_WRONLY, O_RDWR(==O_RDONLY|O_WRONLY), O_CREAT
// permission: 생략 가능. open 시스템 콜을 사용하여 파일을 생성할 때 파일 접근 권한.

int read(int handle, void *buffer, int nbyte);
int write(int handle, void *buffer, int nbyte);
int close(int handle);
*/

// handle은 file-descriptor를 의미

#include <stdio.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int fd, count;
    int buf[512];
    
    if(argc < 2) {
        printf("usage: fileNam[string]\n");
        return 1;
    }
    
    if((fd = open(argv[1], O_WRONLY, S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
        // S_ 들은 File Permission Code
        if(argc >= 3) {
            count = write(fd, argv[2], strlen(argv[2]));
            printf("write %s\n", argv[2]);
            printf("write to file %d byte\n", count);
        }
        else {
            count = read(fd, buf, 512);
            printf("read from file %d bytes\n", count);
            printf("%ls\n", buf);
        }
    } 
    else {
        printf("Failed to open file %s, error_code: %d\n", argv[1], fd);
    }
}
