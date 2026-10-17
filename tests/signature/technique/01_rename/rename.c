#include <stdio.h>

static int _00_add(int a, int b) { return a + b; }
static int _01_mul(int a, int b) { return a * b; }
int       _02_public_add(int a, int b) { return a + b; }
static int _03_cb(int x) { return x * 7; }
static int (*fp)(int) = _03_cb;
static int _04_fact(int n) {
    if (n <= 1) return 1;
    return n * _04_fact(n - 1);
}

int main(void) {
    int sum = 0;
    sum += _00_add(2, 3);
    sum += _01_mul(4, 5);
    sum += _02_public_add(6, 7);
    sum += fp(3);
    sum += _04_fact(10);
    printf("%d\n", sum);
    return 0;
}