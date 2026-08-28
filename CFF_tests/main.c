#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int globalvar = 10;

void _0_nocodeifalone() {
    if (globalvar > 0) {
        // code block 1
        printf("condition true\n");
    }
}

void _0_nocodeifelse() {
    if (globalvar > 0) {
        // code block 1
        printf("condition true\n");
    } else {
        // code block 2
        printf("condition false\n");
    }
}

void _0_global() {
    printf("start: x = %d\n", globalvar);
    int y = globalvar;
    if (globalvar > 0) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    }
    // code block 2
    printf("end: y = %d\n", y);
}

void _1_ifalone(int x, int z) {
    // code block 0
    printf("start: x = %d, z = %d\n", x, z);
    int y = x + z;
    if (x > 0) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    }
    // code block 2
    printf("end: y = %d\n", y);
}
void _1_ifalone_arg_condition(bool cond, int x, int z) {
    // code block 0
    printf("start: x = %d, z = %d\n", x, z);
    int y = x + z;
    if (cond) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    }
    // code block 2
    printf("end: y = %d\n", y);
}
void _2_ifelse(int x, int a, int b) {
    // code block 0
    printf("start: x = %d, a = %d, b = %d\n", x, a, b);
    int y = x + 1;
    if (x > (a == b)) {
        // code block 1
        printf("condition true\n");
        y = y * 2;
    } else {
        // code block 2
        printf("condition false\n");
        y = y * 0;
    }
    // code block 3
    printf("end: y = %d\n", y);
}

void _3_ifflat(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x;
    // code block 1 (if statement 1 - negative check)
    if (x < 0) {
        printf("if 1: x is negative\n");
        y = y + 10;
    }
    // code block 2 (if statement 2 - modulo check)
    if (x % 2 == 0) {
        printf("if 2: x is even\n");
        y = y + 100;
    }
    // code block 3 (if statement 3 - positive check)
    if (x % 3 == 0) {
        printf("if 3: x is divisible by 3\n");
        y = y * 2;
    }
    // code block 4
    printf("end: y = %d\n", y);
}

void _4_prefixheavy(int x, int scale, int bias, int cap) {
    printf("before if 1\n");
    int step1 = x * scale;
    int step2 = step1 + bias;
    int clamped = step2 > cap ? cap : step2;
    if (clamped == cap) {
        printf("inside if 1\n");
        clamped = clamped - 1;
    }
    printf("after if 1\n");
}

void _5_multistage(int x, int y, int weight, int limit) {
    printf("before if 1\n");
    int sum = x + y;
    int weighted = sum * weight;
    printf("before if 2\n");
    if (weighted > limit) {
        printf("inside if 2\n");
        weighted = weighted / 2;
    } else {
        printf("inside if 2 else\n");
        weighted = weighted + 10;
    }
    int final = weighted - x;
    printf("after if 2\n");
}

void _6_ifnested(int x, int a, int b) {
    // code block 0
    printf("start: x = %d, a = %d, b = %d\n", x, a, b);
    int y = x + 1;
    if ((x % 3) > a) {
        // code block 1
        printf("outer condition true ((x %% 3) > a)\n");
        y = y + 5;

        if (y > b) {
            // code block 2
            printf("inner condition true (y > b)\n");
            y = y * 2;
        } else {
            // code block 3
            printf("inner condition false (y <= b)\n");
            y = y - 3;
        }
    } else {
        // code block 4
        printf("outer condition false ((x %% 3) <= a)\n");
        y = y * 0;
    }
    // code block 5
    printf("end: y = %d\n\n", y);
}

void _7_multiifnested(int x, int a, int b) {
    // code block 0
    printf("start: x = %d, a = %d, b = %d\n", x, a, b);
    int y = x + 1;
    if (x > a) {
        // code block 1
        printf("outer condition true (x > a)\n");
        y = y + 5;
        if (y > (b + globalvar)) {
            // code block 2
            printf("inner condition true (y > b + globalvar)\n");
            y = y * 2;
        } else {
            if ((y % 5) == 0) {
                printf("nested check true ((y %% 5) == 0)\n");
            } else {
                printf("nested check false ((y %% 5) != 0)\n");
            }

            // code block 3
            printf("inner condition false (y <= b + globalvar)\n");
            y = y - 3;
        }
    } else {
        // code block 4
        printf("outer condition false (x <= a)\n");
        y = y * 0;
    }
    // code block 5
    printf("end: y = %d\n\n", y);
}

void _8_ifelseifelse(int x) {
    //code block 0
    printf("start: x = %d\n", x);
    int y;
    if (x > 10) {
        //code block 1
        printf("if branch: x > 10\n");
        y = x + 100;
    } else if (x > 5) {
        //code block 2
        printf("else if branch: x > 5\n");
        y = x + 50;
    } else {
        //code block 3
        printf("else branch: x <= 5\n");
        y = x + 10;
    }
    //code block 4
    printf("after conditions: y = %d\n", y);
    int result = y * 2;
    printf("end: result = %d\n\n", result);
}

int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);

    /* --- 0. _0_nocodeifalone (2 paths: if condition TRUE / FALSE) --- */
    printf("\n=== _0_nocodeifalone ===\n");
    printf("_0_nocodeifalone (globalvar > 0 [TRUE]):\n");
    _0_nocodeifalone();
    globalvar = 0;
    printf("_0_nocodeifalone (globalvar > 0 [FALSE]):\n");
    _0_nocodeifalone();

    /* --- 0. _0_nocodeifelse (2 paths: IF block / ELSE block) --- */
    printf("\n=== _0_nocodeifelse ===\n");
    printf("_0_nocodeifelse (globalvar > 0 [TRUE]):\n");
    globalvar = 5;
    _0_nocodeifelse();
    globalvar = 0;
    printf("_0_nocodeifelse (globalvar > 0 [FALSE]):\n");
    _0_nocodeifelse();

    /* --- 0. _0_global (2 paths: if condition TRUE / FALSE) --- */
    printf("\n=== _0_global ===\n");
    printf("_0_global (globalvar > 0 [TRUE]):\n");
    globalvar = 5;
    _0_global();
    globalvar = 0;
    printf("_0_global (globalvar > 0 [FALSE]):\n");
    _0_global();
    

    /* --- 1. _1_ifalone (2 paths: if condition TRUE / FALSE) --- */
    printf("\n=== _1_ifalone ===\n");
    printf("_1_ifalone (x > 0 [TRUE]):\n");
    _1_ifalone(5, 0);
    printf("_1_ifalone (x > 0 [FALSE]):\n");
    _1_ifalone(-1, 5);
    _1_ifalone(a, 5);

    /* --- 1. _1_ifalone_arg_condition - (2 paths: if condition TRUE / FALSE)  --- */
    printf("_1_ifalone_arg_condition (cond [TRUE]):\n");
    _1_ifalone_arg_condition(true, 1, 4);
    printf("_1_ifalone_arg_condition (cond [FALSE]):\n");
    _1_ifalone_arg_condition(false, 1, 4); 

    /* --- 2. _2_ifelse (2 paths: IF block / ELSE block) --- */
    printf("\n=== _2_ifelse ===\n");
    printf("_2_ifelse (x > (a == b) [TRUE]):\n");
    _2_ifelse(5, 2, 1);
    printf("_2_ifelse (x > (a == b) [FALSE]:\n");
    _2_ifelse(-1, 2, 1);
    _2_ifelse(-1, a, 1);

    /* --- 3. _3_ifflat (Path combinations across independent IFs) --- */
    printf("\n=== _3_ifflat ===\n");
    printf("_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [FALSE], x %% 3 == 0 [FALSE]):\n");
    _3_ifflat(1);
    printf("_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [FALSE], x %% 3 == 0 [TRUE]):\n");
    _3_ifflat(3);
    printf("_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [TRUE], x %% 3 == 0 [FALSE]):\n");
    _3_ifflat(2);
    printf("_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [TRUE], x %% 3 == 0 [TRUE]):\n");
    _3_ifflat(6);
    printf("_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [FALSE], x %% 3 == 0 [FALSE]):\n");
    _3_ifflat(-1);
    printf("_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [FALSE], x %% 3 == 0 [TRUE]):\n");
    _3_ifflat(-3);
    printf("_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [TRUE], x %% 3 == 0 [FALSE]):\n");
    _3_ifflat(-2);
    printf("_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [TRUE], x %% 3 == 0 [TRUE]):\n");
    _3_ifflat(-6);
    _3_ifflat(a > 0 ? -a : -2);

    /* --- 4. _4_prefixheavy (2 paths: clamped == cap [TRUE / FALSE]) --- */
    printf("\n=== _4_prefixheavy ===\n");
    printf("_4_prefixheavy (clamped == cap [TRUE]):\n");
    _4_prefixheavy(20, 3, 5, 50);
    printf("_4_prefixheavy (clamped == cap [FALSE], using dynamic 'a'):\n");
    _4_prefixheavy(a, 3, 5, 50);

    /* --- 5. _5_multistage (2 paths: IF block / ELSE block) --- */
    printf("\n=== _5_multistage ===\n");
    printf("_4_prefixheavy (clamped == cap [TRUE]):\n");
    _4_prefixheavy(10, 10, 2, 30);
    printf("_4_prefixheavy (clamped == cap [FALSE]):\n");
    _4_prefixheavy(2, 5, 1, 30);

    printf("\n=== _5_multistage ===\n");
    printf("_5_multistage (weighted > limit [TRUE]):\n");
    _5_multistage(10, 4, 2, 20);
    printf("_5_multistage (weighted > limit [FALSE]):\n");
    _5_multistage(10, 4, 2, 30);
    _5_multistage(a, 4, 2, 30);

    /* --- 6. _6_ifnested (3 distinct execution paths through the nest) --- */
    printf("\n=== _6_ifnested ===\n");
    printf("_6_ifnested (Path 1: (x %% 3) > a [FALSE]):\n");
    _6_ifnested(2, 5, 3);
    printf("_6_ifnested (Path 2: (x %% 3) > a [TRUE], y > b [TRUE]):\n");
    _6_ifnested(5, 1, 3);
    printf("_6_ifnested (Path 3: (x %% 3) > a [TRUE], y <= b [FALSE]):\n");
    _6_ifnested(2, 1, 10);
    _6_ifnested(5, a, 20);

    /* --- 7. _7_multiifnested (4 distinct execution paths through the nest) --- */
    printf("\n=== _7_multiifnested ===\n");
    printf("_7_multiifnested (Path 1: x > a [FALSE]):\n");
    _7_multiifnested(1, 5, 3);
    printf("_7_multiifnested (Path 2: x > a [TRUE], y > (b + globalvar) [TRUE]):\n");
    _7_multiifnested(10, 2, 1);
    printf("_7_multiifnested (Path 3: x > a [TRUE], y <= (b + globalvar), y %% 5 == 0 [TRUE]):\n");
    _7_multiifnested(4, 2, 10);
    printf("_7_multiifnested (Path 4: x > a [TRUE], y <= (b + globalvar), y %% 5 == 0 [FALSE]):\n");
    _7_multiifnested(5, 2, 10);
    _7_multiifnested(5, a, 10);

    printf("\n=== _8_ifelseifelse ===\n");
    printf("_8_ifelseifelse (x > 10 [TRUE]):\n");
    _8_ifelseifelse(20);
    printf("_8_ifelseifelse (x > 10 [FALSE], x > 5 [TRUE]):\n");
    _8_ifelseifelse(8);
    printf("_8_ifelseifelse (x > 10 [FALSE], x > 5 [FALSE]):\n");
    _8_ifelseifelse(3);

    return 0;
}