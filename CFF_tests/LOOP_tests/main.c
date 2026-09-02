#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int globalvar = 10;

void _1_loop_with_if_inside(int a, int b) {
    // loop containing a conditional
    for (int c = 0; c < 5; c++) {
        if (c % 2 == 0) {
            printf("_1_loop_with_if_inside: c=%d even\n", c);
        } else {
            printf("_1_loop_with_if_inside: c=%d odd\n", c);
        }
    }
}

void _2_if_with_loop_in_both_branches(int a, int b) {
    // if/else where each branch has its own loop
    if (a > b) {
        for (int c = 0; c < 3; c++) {
            printf("_2_if_with_loop_in_both_branches: a>b, c=%d\n", c);
        }
    } else {
        int c = 0;
        while (c < 3) {
            printf("_2_if_with_loop_in_both_branches: a<=b, c=%d\n", c);
            c++;
        }
    }
}

void _3_nested_loop_if_loop(int a, int b) {
    // outer loop, inner if, inner loop inside that if
    for (int c = 0; c < 3; c++) {
        if (c == 1) {
            for (int d = 0; d < 2; d++) {
                printf("_3_nested_loop_if_loop: c=%d, inner d=%d\n", c, d);
            }
        } else {
            printf("_3_nested_loop_if_loop: c=%d, no inner loop\n", c);
        }
    }
}

/* ---------- 4: several setup/code blocks before the loop, && inside ---------- */
void _4_manyblocks_loop(int a, int b) {
    // code block 1: basic derived values
    int sum = a + b;
    int diff = a - b;

    // code block 2: derive the loop bound
    int limit;
    if (sum > 0) {
        limit = sum;
    } else {
        limit = 5;
    }

    // code block 3: clamp the bound
    if (limit > 10) {
        limit = 10;
    }

    for (int c = 0; c < limit; c++) {
        if (c % 2 == 0 && diff > 0) {
            printf("_4_manyblocks_loop: c=%d even and diff>0\n", c);
        } else {
            printf("_4_manyblocks_loop: c=%d other\n", c);
        }
    }
}

/* ---------- 5: loop body driven by a nested ternary mixing && / || ---------- */
void _5_ternary_loop(int a, int b) {
    for (int c = 0; c < 4; c++) {
        int label = (c % 2 == 0 && a > 0) ? 1
                     : ((c > b || a < 0) ? 2 : 3);
        printf("_5_ternary_loop: c=%d label=%d\n", c, label);
    }
}


int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);

    // _1: only one possible path — a,b never checked, so one call covers it
    printf("--- _1 normal ---\n");
    _1_loop_with_if_inside(0, 0);
    printf("--- _1 CFF (high-level) ---\n");
    //_1_CFF_loop_with_if_inside(0,0);

    // _2: two real paths, driven by a vs b
    printf("--- _2 call 1 (a > b) ---\n");
    _2_if_with_loop_in_both_branches(5, 2);

    printf("--- _2 call 2 (a <= b) ---\n");
    _2_if_with_loop_in_both_branches(2, 5);

    // _3: only one possible path — c==1 always fires the same way each run
    printf("--- _3 call 1 (only path) ---\n");
    _3_nested_loop_if_loop(0, 0);

    // _4: condition varies with the loop index c -> one call covers both branches
    printf("--- _4 call 1 ---\n");
    _4_manyblocks_loop(3, 2);

    // _5: nested ternary varies with c -> one call covers all three labels
    printf("--- _5 call 1 ---\n");
    _5_ternary_loop(3, 2);

   // _0_cff_only_loop(2,0);
   // _0_cff_if_inside_loop(2,0);

   
    return 0;
}

/*void _0_cff_only_loop(int a, int b) {
    int c = 0;
    while(1){
        switch(c){
            case 0:
                if(globalvar > 0){
                    b=1;
                }else{
                    b=2;
                }
                break;
            case 1:
                while(globalvar != 0){
                    printf("condition true\n");
                    globalvar--;
                }
                c=2;
                break;
            default:
                return;
        }
    }
}

void _0_cff_if_inside_loop(int a, int b) {
    int c = 0;
    while(1){
        switch(c){
            case 0:
                if(globalvar > 0){
                    c=1;
                }else{
                    c=4;
                }
                break;
            case 1:
                printf("condition true\n");
                c=4;
                break;
            case 2:
                for(int i=0; i <10 ; i++){
                    if(i%2==0){
                        c=3;
                    }else{
                        c=2;
                    }
                }
                c=4;
                break;
            case 3:
                printf("something");
            default:
                return;
        }
    }
}
*/
/*void _1_CFF_loop_with_if_inside(int a, int b) {
    int i=0;
    int c=0;
    while(1){
        switch(i){
            case 0:
                if(c<5) i=1;
                else i=5;
                break;
            case 1:
                if (c % 2 == 0) i=2;
                else i=3;
                break;
            case 2:
                printf("_1_loop_with_if_inside: c=%d even\n", c);
                i=4;
                break;
            case 3:
                printf("_1_loop_with_if_inside: c=%d odd\n", c);
                i=4;
                break;
            case 4:
                c++;
                i=0;
                break;
            default:
                return;
        }
    }
}*/