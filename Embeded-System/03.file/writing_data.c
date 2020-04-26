#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

char* get_timestamp() {
    time_t now = time(NULL);
    return asctime(localtime(&now));
}

int main(int argc, char *argv[]) {
    char* filename = argv[1];
    char* timestamp = get_timestamp();

    int fd = open(filename, O_WRONLY|O_CREAT|O_APPEND, 0666);
    size_t length = strlen(timestamp);
    write(fd, timestamp, length);
    close(fd);
    return 0;
}
