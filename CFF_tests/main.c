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

void _2_ifelse(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x + 1;

    if (x > 0) {
        // code block 1
        printf("positive branch\n");
        y = y * 2;
    } else {
        // code block 2
        printf("non-positive branch\n");
        y = y - 1;
    }

    // code block 3
    printf("end: y = %d\n", y);
}

void _3_ifnested(int x) {
    if (x > 0) { 
        if (x % 2 == 0) {
            printf("inner true (even)\n");
        }else{
            if(x == 3){ 
                 if(x==20) printf("inner true (even)\n"); 
            }else{ 
                printf("inner true (even)\n");
            }
            if(x == 10) x =10;
            else x=20; 
        }
    }
    printf("end: y = %d\n", x);
}

int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);
    
    printf("_1_ifalone before:\n");    _1_ifalone(a);
    printf("_1_ifalone before:\n");    _2_ifelse(a);
    printf("_1_ifalone before:\n");    _3_ifnested(a);
    

    return 0;
}