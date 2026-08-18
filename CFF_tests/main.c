#include <stdio.h>
#include <stdlib.h>

void _1_ifalone(int x, int multiplier, int offset) {
    printf("before if 1\n");
    int y = x + offset;
    if (x > 0) {
        printf("inside if 1\n");
        y = y * multiplier;
    }
    printf("after if 1\n");
}

void _2_ifelse(int x, int pos_factor, int neg_offset) {
    printf("before if 1\n");
    int y = x + 1;
    if (x > 0) {
        printf("inside if 1\n");
        y = y * pos_factor;
    } else {
        printf("inside if 1 else\n");
        y = y - neg_offset;
    }
    printf("after if 1\n");
}

void _3_ifflat(int x, int mod, int threshold, int alt_value) {
    printf("before if 1\n");
    int is_positive     = (x > 0);
    int is_even         = is_positive && (x % mod == 0);
    int is_positive_odd = is_positive && !is_even;
    int result          = x;
    if (is_even) {
        printf("inside if 1\n");
    }
    if (is_positive_odd) {
        printf("inside if 2\n");
    }
    printf("before if 3\n");
    if (x == threshold) {
        printf("inside if 3\n");
        result = threshold;
    } else {
        printf("inside if 3 else\n");
        result = alt_value;
    }
    printf("after if 3\n");
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

void _6_ifnested(int x, int y, int divisor) {
    printf("before if 1\n");
    if (x > 0) {
        printf("inside if 1\n");

        if (x % 2 == 0) {
            printf("inside if 1.2\n");
        } else {
            printf("inside if 1.2 else\n");

            if (x == 3) {
                printf("inside if 1.2.3\n");

                if (x == 20) {
                    printf("inside if 1.2.3.4\n");
                } else {
                    printf("inside if 1.2.3.4 else\n");
                }
            } else {
                printf("inside if 1.2.3 else\n");
            }
        }
    } else {
        printf("inside if 1 else\n");
    }
    printf("after if 1\n");
}

int main(int argc, char** argv) {
    int a;
    printf("a: %d\n", argc);
    if (argc == 1) a = 0;
    else a = atoi(argv[1]);

    /* --- 1. _1_ifalone (2 paths: if condition TRUE / FALSE) --- */
    printf("\n=== _1_ifalone ===\n");
    printf("_1_ifalone (x > 0 [TRUE]):\n");
    _1_ifalone(5, 2, 0);
    printf("_1_ifalone (x > 0 [FALSE]):\n");
    _1_ifalone(-1, 2, 0);

    /* --- 2. _2_ifelse (2 paths: IF block / ELSE block) --- */
    printf("\n=== _2_ifelse ===\n");
    printf("_2_ifelse (x > 0 [TRUE]):\n");
    _2_ifelse(5, 2, 1);
    printf("_2_ifelse (x > 0 [FALSE]):\n");
    _2_ifelse(-1, 2, 1);

    /* --- 3. _3_ifflat (4 path combinations across independent IFs) --- */
    printf("\n=== _3_ifflat ===\n");
    printf("_3_ifflat (is_even [TRUE], x == threshold [TRUE]):\n");
    _3_ifflat(10, 2, 10, 20);
    printf("_3_ifflat (is_even [TRUE], x == threshold [FALSE]):\n");
    _3_ifflat(4, 2, 10, 20);
    printf("_3_ifflat (is_positive_odd [TRUE], x == threshold [TRUE]):\n");
    _3_ifflat(5, 2, 5, 20);
    printf("_3_ifflat (is_positive_odd [TRUE], x == threshold [FALSE]):\n");
    _3_ifflat(3, 2, 10, 20);
    printf("_3_ifflat (neither even nor odd positive, x == threshold [FALSE]):\n");
    _3_ifflat(-2, 2, 10, 20);

    /* --- 4. _4_prefixheavy (2 paths: clamped == cap [TRUE / FALSE]) --- */
    printf("\n=== _4_prefixheavy ===\n");
    printf("_4_prefixheavy (clamped == cap [TRUE]):\n");
    _4_prefixheavy(20, 3, 5, 50); 
    printf("_4_prefixheavy (clamped == cap [FALSE]):\n");
    _4_prefixheavy(10, 3, 5, 50);

    /* --- 5. _5_multistage (2 paths: IF block / ELSE block) --- */
    printf("\n=== _5_multistage ===\n");
    printf("_5_multistage (weighted > limit [TRUE]):\n");
    _5_multistage(10, 10, 2, 30); 
    printf("_5_multistage (weighted > limit [FALSE]):\n");
    _5_multistage(1, 4, 2, 30);  

    /* --- 6. _6_ifnested (4 distinct execution paths through the nest) --- */
    printf("\n=== _6_ifnested ===\n");
    printf("_6_ifnested (Path 1: Outer x > 0 [FALSE]):\n");
    _6_ifnested(-1, 7, 3);
    
    printf("_6_ifnested (Path 2: x > 0 [TRUE], x mod 2 == 0 [TRUE]):\n");
    _6_ifnested(4, 7, 3);
    
    printf("_6_ifnested (Path 3: x > 0 [TRUE], x mod 2 != 0, x == 3 [FALSE]):\n");
    _6_ifnested(5, 7, 3);
    
    printf("_6_ifnested (Path 4: x > 0 [TRUE], x mod 2 != 0, x == 3 [TRUE], x == 20 [FALSE]):\n");
    _6_ifnested(3, 7, 3);


    return 0;
}