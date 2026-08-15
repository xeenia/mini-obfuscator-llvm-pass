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

int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);
    
    printf("_1_ifalone before:\n");    _1_ifalone(a);
    

    return 0;
}