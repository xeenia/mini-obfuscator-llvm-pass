#include <stdio.h>

static int _00_two(int a, int b)               { return a*100 + b*10; }
static int _01_three(int a, int b, int c)      { return a*100 + b*10 + c; }
static int _02_four(int a, int b, int c, int d){ return a*1000+b*100+c*10+d; }

static int _03_mixed(int a, double b, long c) {
    return a*100 + (int)(b*10) + (int)c;
}

static int _04_cb(int x) { return x * 7; }

static int _05_fact(int n) {
    if (n <= 1) return 1;
    return n * _05_fact(n - 1);
}

static int _06_variadic(int n, ...) { return 0; }

int main(void) {
    int sum = 0;
    sum += _00_two(2, 7);
    sum += _01_three(1, 2, 3);
    sum += _02_four(1, 2, 3, 4);
    sum += _03_mixed(2, 3.5, 4);
    int (*fp)(int) = _04_cb;
    sum += fp(3);
    sum += _04_cb(3);
    sum += _05_fact(19);
    printf("%d\n", sum);
    return 0;
}