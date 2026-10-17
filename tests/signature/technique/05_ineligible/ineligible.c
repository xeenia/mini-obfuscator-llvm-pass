#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

int main(void);

static int _00_vararg_sum(int n, ...) {
    va_list ap; va_start(ap, n);
    int s = 0; for (int i=0;i<n;i++) s += va_arg(ap,int);
    va_end(ap); return s;
}

static int _01_square(int x) { return x*x; }
static int _02_triple(int x) { return x*3; }
int (*ops[])(int) = { _01_square, _02_triple };

__attribute__((constructor)) static void _03_init(void) {}

static int _04_local_cb(int x) { return x + 10; }

int main(void) {
    int sum = 0;
    sum += _00_vararg_sum(3,1,2,3);
    sum += ops[0](4);
    sum += ops[1](4);
    int (*fp)(int) = _04_local_cb;
    sum += fp(5);
    sum += abs(-9);
    printf("%d\n", sum);
    return 0;
}