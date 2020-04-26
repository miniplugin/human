/*
임베디드시스템 3주차 강의자료.
새로운 thread를 만들어보고 실행한다.

주의!
thread를 사용하는 프로그램을 gcc/g++에서 컴파일하기 위해서는 -thread 태그를 붙여줘야 한다.
*/

#include <stdio.h>
#include <pthread.h>

// thread_entry는 무조건? void* (*)(void*) 형태여야 한다
void* thread_entry(void *arg) {
    int loop = 5;
    int *thread_arg = (int*)arg;
    printf("thread: start\n");
    printf("thread: working");
    while(loop--) {
        printf(".");
        fflush(stdout); // ??
        sleep(1);
    }
    printf("\n");
    printf("thread: end\n");
    
    return (void*)((*thread_arg)*100);
}

int main(int argc, char *argv[]) {
    int thread_arg = 369;
    int thread_return = 0;
    pthread_t thread_id;
    printf("main: start\n");
    printf("main: pthread_create\n");
    pthread_create(&thread_id, NULL, thread_entry, &thread_arg);
    printf("main: thread_id %lu\n", thread_id);
    pthread_join(thread_id, (void**)(&thread_return));
    printf("main: thread status %d\n", thread_return);
    return 0;
}
