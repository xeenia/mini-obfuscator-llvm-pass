#include <stdio.h>
#include <stdlib.h>

void _1_ifalone(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x;

    if (x > 0) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    }

    // code block 2
    printf("end: y = %d\n", y);
}

void _3_ifnested(int x) {
   // code block 0
    printf("start: x = %d\n", x);
    int y = x;

    if (x > 0) {
        // code block 1
        printf("outer true\n");
        y = y + 10;

        if (x % 2 == 0) {
            // code block 2
            printf("inner true (even)\n");
            y = y * 3;
        }else{
            x = x % 2;
            if(x == 3){
                 printf("inner true (even)\n");
            }
        }

        // code block 3
        printf("after inner if\n");
        y = y + 1;
    }

    // code block 4
    printf("end: y = %d\n", y);
}

int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);
    
    printf("_1_ifalone before:\n");    _1_ifalone(a);
    printf("_1_ifalone before:\n");    _3_ifnested(a);
    

    return 0;
}