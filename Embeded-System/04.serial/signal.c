#include <signal.h>
#include <unistd.h>
#include <stdio.h>

void sig_handler(int signo);

int main(int argc, char **argv) {
    int i = 0;
    // SIGINT signal이 들어오면 sig_handler 함수를 실행하도록 함
    // SIGINT = SIG INTERRUPT = Ctrl+C
    signal(SIGINT, (void*)sig_handler);
    while(1) {
        printf("%d\n", i);
        sleep(2);
        i++;
    }
}

void sig_handler(int signo) {
    printf("I received SIGINT(%d)\n", signo);
}


// sigaction struct에서 sa_mask. mask는 가린다는 뜻.
// 해당 signal handler가 동작하는 중에 다른 signal이 들어왔을 때
// mask한 signal이 들어오면 막는다.

