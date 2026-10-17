#include "utils.h"
#include <stdarg.h>

int _00_public_add(int a, int b) { return a + b; }
int _01_public_mul(int a, int b) { return a * b; }

int _02_mixed(int a, double b, long c) {
    return a * 100 + (int)(b * 10) + (int)c;
}

int _03_callback(int x) { return x * 7; }

int _05_fact(int n) {
    if (n <= 1) return 1;
    return n * _05_fact(n - 1);
}

int _04_variadic_sum(int n, ...) {
    va_list ap;
    va_start(ap, n);
    int s = 0;
    for (int i = 0; i < n; i++)
        s += va_arg(ap, int);
    va_end(ap);
    return s;
}

static int _06_internal_helper(int x) { return x + 100; }

int _07_force_internal(int x) { return _06_internal_helper(x); }