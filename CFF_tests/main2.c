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

void _2_ifelse(int x, int a, int b) {
    // code block 0
    printf("start: x = %d\n", x);
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

void _3_flat_ifs(int x) {
    // code block 0
    printf("start: x = %d\n", x);
    int y = x;
    // code block 1 (if statement 1)
    if (x < 0) {
        printf("if 1: x is negative\n");
        y = y + 10;
    }
    // code block 2 (if statement 2)
    if (x == 0) {
        printf("if 2: x is zero\n");
        y = y + 100;
    }
    // code block 3 (if statement 3)
    if (x > 0) {
        printf("if 3: x is positive\n");
        y = y * 2;
    }
    // code block 4
    printf("end: y = %d\n", y);
}

void _3_ifflat(int x, int mod, int threshold, int alt_value) {
    printf("[_3_ifflat] start: x=%d, mod=%d, threshold=%d, alt_value=%d\n", x, mod, threshold, alt_value);

    int is_positive     = (x > 0);
    int is_even         = is_positive && (x % mod == 0);
    int is_positive_odd = is_positive && !is_even;
    int result          = x;

    if (is_even) {
        printf("[_3_ifflat] branch A: x=%d is positive and divisible by %d\n", x, mod);
    }

    if (is_positive_odd) {
        printf("[_3_ifflat] branch B: x=%d is positive and not divisible by %d\n", x, mod);
    }

    if (x == threshold) {
        printf("[_3_ifflat] branch C: x=%d equals threshold %d\n", x, threshold);
        result = threshold;
    } else {
        printf("[_3_ifflat] branch D: x=%d differs from threshold %d\n", x, threshold);
        result = alt_value;
    }

    printf("[_3_ifflat] end: result=%d\n", result);
}

void _4_prefixheavy(int x, int scale, int bias, int cap) {
    printf("[_4_prefixheavy] start: x=%d, scale=%d, bias=%d, cap=%d\n", x, scale, bias, cap);

    int step1 = x * scale;
    printf("[_4_prefixheavy] computed step1=%d (x*scale)\n", step1);

    int step2 = step1 + bias;
    printf("[_4_prefixheavy] computed step2=%d (step1+bias)\n", step2);

    int clamped = step2 > cap ? cap : step2;
    printf("[_4_prefixheavy] computed clamped=%d (min of step2, cap)\n", clamped);

    if (clamped == cap) {
        printf("[_4_prefixheavy] branch: clamped value %d hit the cap %d\n", clamped, cap);
        clamped = clamped - 1;
    }

    printf("[_4_prefixheavy] end: clamped=%d\n", clamped);
}

void _5_multistage(int x, int y, int weight, int limit) {
    printf("[_5_multistage] start: x=%d, y=%d, weight=%d, limit=%d\n", x, y, weight, limit);

    int sum = x + y;
    printf("[_5_multistage] computed sum=%d\n", sum);

    int weighted = sum * weight;
    printf("[_5_multistage] computed weighted=%d\n", weighted);
    while(weighted < 0) weighted--;
    if (weighted > limit) {
        printf("[_5_multistage] branch: weighted=%d exceeds limit=%d, scaling down\n", weighted, limit);
        weighted = weighted / 2;
    } else {
        printf("[_5_multistage] branch: weighted=%d within limit=%d, boosting\n", weighted, limit);
        weighted = weighted + 10;
    }

    int final = weighted - x;
    printf("[_5_multistage] computed final=%d (weighted-x)\n", final);

    printf("[_5_multistage] end: final=%d\n", final);
}

void _6_ifnested(int x, int y, int divisor) {
    printf("[_6_ifnested] start: x=%d, y=%d, divisor=%d\n", x, y, divisor);
    int z = x + y;

    if (x > 0) {
        printf("[_6_ifnested] outer branch: x=%d is positive\n", x);

        if (z % divisor == 0) {
            printf("[_6_ifnested] inner branch: z=%d divisible by divisor=%d\n", z, divisor);
            z = z / divisor;
        } else {
            printf("[_6_ifnested] inner branch: z=%d not divisible by divisor=%d\n", z, divisor);
            z = z + divisor;
        }
    } else {
        printf("[_6_ifnested] outer branch: x=%d is non-positive\n", x);
        z = z - 1;
    }

    printf("[_6_ifnested] end: z=%d\n", z);
}
void _7_ifnested(int x, int y, int divisor) { //produces a bug 
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

    printf("_1_ifalone before:\n");     _1_ifalone(a);
    printf("_2_ifelse before:\n");      _2_ifelse(a, 2, 1);
    printf("_3_ifflat before:\n");      _3_ifflat(a, 2, 10, 20);
    printf("_4_prefixheavy before:\n"); _4_prefixheavy(a, 3, 5, 50);
    printf("_5_multistage before:\n");  _5_multistage(a, 4, 2, 30);
    printf("_6_ifnested before:\n");    _6_ifnested(a, 7, 3);

    return 0;
}