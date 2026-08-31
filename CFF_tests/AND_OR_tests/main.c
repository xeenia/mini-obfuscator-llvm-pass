#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int globalvar = 10;

int _0_code_AND(int a, int b) {
    if (a == 0 && a > 10) {
       return a+b;
    }else{
        return a-b;
    }
}

void _0_code_OR(int a, int b) {
    if (a == 0 || b > 10) {
       a=10;
    }else{
        b=0;
    }
}

/*void _0_cff_AND(int a, int b) {
    int c = 0;
    while(1){
        switch(c){
            case 0:
                if(a == 0 && b > 10){
                    b=1;
                }else{
                    b=2;
                }
                break;
            case 1:
                a=10;
                c=3;
                break;
            case 2:
                b=0;
                c=3;
                break;
            default:
                return;
        }
    }
}

void _0_cff_OR(int a, int b) {
    int c = 0;
    while(1){
        switch(c){
            case 0:
                if(a == 0 || b > 10){
                    b=1;
                }else{
                    b=2;
                }
                break;
            case 1:
                a=10;
                c=3;
                break;
            case 2:
                b=0;
                c=3;
                break;
            default:
                return;
        }
    }
}
*/
int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);

    /* --- 0. _0_nocodeifalone (2 paths: if condition TRUE / FALSE) --- */
    printf("\n=== _0_nocodeifalone ===\n");
    printf("_0_nocodeifalone (globalvar > 0 [TRUE]):\n");
    printf("%d\n", _0_code_AND(a,a+5));
    //_0_cff_AND(2,0);

    _0_code_OR(a,a+10);
    //_0_cff_OR(2,0);

   
    return 0;
}