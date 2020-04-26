#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>


int isChar(char c) {
    if(0 < c && c <= 127) {
        return 1;
    } else {
        return 0;
    }
}

int main(int argc, char *argv[]) {
    int i;
    int fd;
    char *mapAddr;
    if(argc != 2) {
        printf("usage: %s fileName\n", argv[0]);
        return 1;
    }
    
    if((fd = open(argv[1], O_RDONLY)) < 0) {
        perror("open");
        return 1;
    }
    
    mapAddr = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fd, 0);
    i = 0;
    
    while(isChar(mapAddr[i])) {
        printf("%c", mapAddr[i++]);
    }
    printf("\n");
}


