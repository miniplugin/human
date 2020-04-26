/*
임베디드시스템 3주차 강의자료.

Another solution to create child process is using `stdlib.h > system()`
It will return child process's pid.
For example,
```C
#include <stdlib.h>

int main() {
    int child_pid = system("ls -l /");
}
*/

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    pid_t child_pid;
    printf("the main program process ID is %d\n", (int)getpid());
    child_pid = fork();

    // Two processes will execute same script after `fork()`
    if(child_pid != 0) {
        // on the parent process
        printf("this is the parent process, with id %d\n", (int)getpid());
        printf("the child's process ID is %d\n", (int)child_pid);
    }
    else {
        // on the child process
        printf("this is the child process, with id %d\n", (int)getpid());
    }
    return 0;
}
