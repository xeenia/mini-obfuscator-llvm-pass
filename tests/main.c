#include <stdio.h>
#include <stdarg.h>

// defined in utils.c
int multiply(int a, int b);
int pack_color(int red, int green, int blue, int alpha);
long build_record(int id, double weight, char grade, long timestamp);
int negate(int value);
int constant_answer(void);
int factorial(int n);

int sum_all(int count, ...) {
    va_list args;
    va_start(args, count);
    int total = 0;
    for (int i = 0; i < count; i++)
        total += va_arg(args, int);
    va_end(args);
    return total;
}
int sub(int a, int b) {
    return a - b;
}

int square(int x) {
    return x * x;
}

int triple(int x) {
    return x * 3;
}
int (*g_ops[])(int) = { square, triple };


int main(void) {
    printf("multiply(6, 7)      -> %d   (expect 42)\n", multiply(6, 7));


    printf("pack_color(...)     -> %d   (expect -1430532899 as signed int)\n",
           pack_color(0xAA, 0xBB, 0xCC, 0xDD));


    printf("build_record(...)   -> %ld  (expect 1207)\n",
           build_record(7, 1.5, 'A', 1000));

    printf("negate(9)           -> %d   (expect -9)\n", negate(9));
    printf("constant_answer()   -> %d   (expect 42)\n", constant_answer());
    printf("factorial(5)        -> %d   (expect 120)\n", factorial(5));

    printf("sum_all(3,1,2,3)    -> %d   (expect 6, vararg is excluded)\n",
           sum_all(3, 1, 2, 3));

    printf("sub(5,3)   -> %d   (expect 2)\n",  sub(5, 3));
    printf("sub(3,5)   -> %d   (expect -2)\n", sub(3, 5));

    int (*fp)(int) = square;
    printf("square via fp(4)    -> %d   (expect 16)\n", fp(4));
    printf("triple via table(4) -> %d   (expect 12)\n", g_ops[1](4));

    return 0;
}
