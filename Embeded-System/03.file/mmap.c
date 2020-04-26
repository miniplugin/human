/*
Using `mmap` is better than `open` when IO data size is larger
    especially multimedia transform.

Function `mmap` map file-descriptor to memory range.
*/

#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>

int is_char(char c) {
    return 0 < c && c < 127;
}

int main(int argc, char *argv[]) {
    int i;
    int fd;
    char *map_addr;
    if(argc != 2) {
        printf("usage: %s fileName\n", argv[0]);
        return 1;
    }
    if((fd = open(argv[1], O_RDONLY)) < 0) {
        perror("open");
        return 1;
    }

    // mapping memory range 0~4096 to file(fd)
    map_addr = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fd, 0);
    i = 0;

    while(is_char(map_addr[i])) {
        printf("%c, %s\n", map_addr[i], &map_addr[i]);
        i++;
    }
    printf("\n");
    close(fd);
}
