#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "utils.h"

static int _00_local_zero(void)               { return 17; }
static int _01_local_one(int x)               { return x * 3 + 1; }
static int _02_local_two(int a, int b)        { return a * 100 + b; }
static int _03_local_three(int a, int b, int c){ return a*100 + b*10 + c; }

static int _04_local_cb(int x) { return x + 10; }

static int _05_square(int x) { return x * x; }
static int _06_triple(int x) { return x * 3; }
static int (*ops[])(int) = { _05_square, _06_triple };

__attribute__((constructor))
static void _07_init(void) {}

int main(void) {
    int sum = 0;

    sum += _00_local_zero();
    sum += _01_local_one(5);
    sum += _02_local_two(1, 2);
    sum += _03_local_three(1, 2, 3);

    sum += _00_public_add(6, 7);
    sum += _01_public_mul(4, 5);
    sum += _02_mixed(2, 3.5, 4);

    sum += _03_callback(3);
    sum += _05_fact(5);

    int (*fp_local)(int) = _04_local_cb;
    sum += fp_local(5);

    int (*fp_cross)(int) = _03_callback;
    sum += fp_cross(3);

    sum += ops[0](4);
    sum += ops[1](4);

    sum += _04_variadic_sum(3, 4, 5, 6);
    sum += abs(-9);

    sum += _07_force_internal(0);

    printf("%d\n", sum);
    return 0;
}