#include <stdio.h>

/* ================= IF GROUP ================= */

/* ---------- 0: if/else with && ---------- */
void _0_ifelseAND(int a, int b) {
    if (a > 0 && b > 0) {
        printf("_0_ifelseAND: both positive\n");
    } else {
        printf("_0_ifelseAND: not both positive\n");
    }
}

/* ---------- 1: if/else with || ---------- */
void _1_ifelseOR(int a, int b) {
    if (a > 0 || b > 0) {
        printf("_1_ifelseOR: at least one positive\n");
    } else {
        printf("_1_ifelseOR: neither positive\n");
    }
}

/* ---------- 2: no if statement, ternary (?:) mixing && and || ---------- */
int _2_ternaryMIX(int a, int b) {
    int sum_or_diff = (a > 0 && b > 0) ? (a + b) : (a - b);
    int flag = (a < 0 || b < 0) ? -1 : 1;
    printf("_2_ternaryMIX: sum_or_diff=%d flag=%d\n", sum_or_diff, flag);
    return sum_or_diff * flag;
}

/* ================= LOOP GROUP ================= */

/* ---------- 3: while loop with && ---------- */
void _3_whileAND(int a, int b) {
    while (a > 0 && b > 0) {
        printf("_3_whileAND: looping, a=%d b=%d\n", a, b);
        a--;
        b--;
    }
    printf("_3_whileAND: loop exited\n");
}

/* ---------- 4: for loop with || ---------- */
void _4_forOR(int n) {
    for (int i = 0; i < 3 || i < n; i++) {
        // code block: forces at least 3 iterations
        printf("_4_forOR: i=%d\n", i);
        if (i > 20) break; // safety guard
    }
}

/* ---------- 5: many setup instructions before a for loop, nested
   if/else with && inside the loop (varies with i, so a single call
   already exercises both branches) ---------- */
void _5_manyblocksAND(int n, int offset) {
    // code block: setup
    int base = n + offset;
    int half = base / 2;
    int threshold = half > 0 ? half : 1;
    printf("_5_manyblocksAND: base=%d half=%d threshold=%d\n",
           base, half, threshold);

    for (int i = 0; i < n; i++) {
        // code block: per-iteration setup
        int doubled = i * 2;
        if (doubled > 0 && doubled < threshold) {
            printf("_5_manyblocksAND: i=%d doubled=%d < threshold\n", i, doubled);
        } else {
            printf("_5_manyblocksAND: i=%d doubled=%d NOT < threshold\n", i, doubled);
        }
    }
}

int main(void) {
    // if-group: single evaluation -> call once for true, once for false
    _0_ifelseAND(1, 2);    // true
    _0_ifelseAND(-1, 2);   // false

    _1_ifelseOR(-1, 2);    // true
    _1_ifelseOR(-1, -2);   // false

    printf("_2_ternaryMIX: result=%d\n", _2_ternaryMIX(3, 4));   // both ternaries "true" side
    printf("_2_ternaryMIX: result=%d\n", _2_ternaryMIX(-3, 4));  // both ternaries "false" side

    // loop-group: condition varies across iterations -> one call is enough
    _3_whileAND(3, 2);
    _4_forOR(1);
    _5_manyblocksAND(8, 2);

    return 0;
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
