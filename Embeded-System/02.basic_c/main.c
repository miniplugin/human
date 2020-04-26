#include <stdio.h>

int main(int argc, char *argv[]) {
    // argc - argv의 개수
    // argv str의 집합
    
    int i = 0;
    printf("Hello World\n");
    printf("Number of argv: %d\n", argc);
    for(i = 0; i < argc; i++) {
        printf("argv[%02d] %s\n", i, argv[i]);
    }
}

/*
./a.out hello woakerkmlr mawklerm wlmer kmaw elrmwakelr mwlakem rlkwaem lwmrl kmaweklrm awklmr lwao
Hello World
Number of argv: 13
argv[00] ./a.out
argv[01] hello
argv[02] woakerkmlr
argv[03] mawklerm
argv[04] wlmer
argv[05] kmaw
argv[06] elrmwakelr
argv[07] mwlakem
argv[08] rlkwaem
argv[09] lwmrl
argv[10] kmaweklrm
argv[11] awklmr
argv[12] lwao
*/

/*
./a.out %ls -s
Hello World
Number of argv: 3
argv[00] ./a.out
argv[01] %ls
argv[02] -s
*/

/*
ls -l | ./a.out
Hello World
Number of argv: 1
argv[00] ./a.out
*/

/*
kitsune@DESKTOP-QPKRHUF:/mnt/d/dev/EmbededSystem/02.basic_c$ echo "hi" | ./a.out
Hello World
Number of argv: 1
argv[00] ./a.out
kitsune@DESKTOP-QPKRHUF:/mnt/d/dev/EmbededSystem/02.basic_c$ ./a.out hi
Hello World
Number of argv: 2
argv[00] ./a.out
argv[01] hi
*/
