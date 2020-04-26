/*
IOCTL
other tasks except writing, reading
*/
#include <sys/ioctl.h>
#include <sys/types.h>
#include <fcntl.h>
#include <linux/cdrom.h>

#define CDDEVICE "/dev/cdrom"

int main(int argc, char** argv) {
    int cdrom;
    if((cdrom = open(CDDEVICE, O_RDONLY|O_NONBLOCK)) < 0) {
        perror("open");
        return 1;
    }
    if(ioctl(cdrom, CDROM_LOCKDOOR, 0) < 0) {
        perror("ioctl");
        return 1;
    }
    
    close(cdrom);
}
