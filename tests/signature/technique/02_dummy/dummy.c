#include <stdio.h>
#include <stdarg.h>

static int _00_zero(void)               { return 17; }
static int _01_one(int x)               { return x * 3 + 1; }
static int _02_two(int a, int b)        { return a * 100 + b; }
static int _03_three(int a, int b, int c){ return a*100 + b*10 + c; }
static int _04_cb(int x) { return x * 7; }

static int _05_fact(int n) {
    if (n <= 1) return 1;
    return n * _05_fact(n - 1);
}

static int _06_variadic(int n, ...) {
    va_list ap; va_start(ap, n);
    int s = 0;
    for (int i = 0; i < n; i++) s += va_arg(ap, int);
    va_end(ap);
    return s;
}

int main(void) {
    int sum = 0;
    sum += _00_zero();
    sum += _01_one(5);
    sum += _02_two(1, 2);
    sum += _03_three(1, 2, 3);
    sum += _06_variadic(3, 4, 5, 6);
    int (*fp)(int) = _04_cb;
    sum += fp(3);
    sum += _04_cb(3);
    sum += _05_fact(15);
    printf("%d\n", sum);
    return 0;
}