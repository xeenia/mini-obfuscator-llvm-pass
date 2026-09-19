#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

/* ================================================================== */
/* Global Variables                                                   */
/* ================================================================== */
static int g_counter = 0;
static int g_config[4] = {10, 20, 30, 40};


/* ================================================================== */
/* 0. No arguments: Global state modification + While loop            */
/* ================================================================== */
int _00_no_args_globals(void)
{
    g_counter += 5;
    int sum = 0;
    int i = 0;

    while (i < 4) {
        sum += g_config[i] + g_counter;
        i++;
    }

    return sum;
}


/* ================================================================== */
/* 1. Single argument: Standard loops + Simple If/Else                 */
/* ================================================================== */
int _01_loop_if_single_arg(int n)
{
    int acc = 0;

    if (n < 0) {
        return -1;
    }

    for (int i = 0; i < n; i++) {
        if (i % 2 == 0) {
            acc += i * 2;
        } else {
            acc += i;
        }
    }

    return acc;
}


/* ================================================================== */
/* 2. Two arguments: Array manipulation with pointers                 */
/* ================================================================== */
int _02_pointer_array_two_args(int *arr, int len)
{
    if (!arr || len <= 0) return 0;

    int total = 0;
    int *ptr = arr;

    for (int i = 0; i < len; i++) {
        *ptr = *ptr * 2 + g_counter;
        total += *ptr;
        ptr++;
    }

    return total;
}


/* ================================================================== */
/* 3. Single argument: Complex Switch with Goto                       */
/* ================================================================== */
int _03_switch_goto(int mode)
{
    int result = 0;

    switch (mode & 3) {
        case 0:
            goto MODE_ZERO;
        case 1:
            result = 100;
            break;
        case 2:
            goto MODE_TWO;
        default:
            result = -1;
            break;
    }
    goto EXIT;

MODE_ZERO:
    result = 50;
    goto EXIT;

MODE_TWO:
    result = 200;

EXIT:
    return result + g_counter;
}


/* ================================================================== */
/* 4. Two arguments: Nested Loops with Break / Continue               */
/* ================================================================== */
int _04_nested_loops_control(int rows, int cols)
{
    int total = 0;

    for (int r = 0; r < rows; r++) {
        if (r == 5) break;

        for (int c = 0; c < cols; c++) {
            if (c == 2) continue;
            total += (r + 1) * (c + 1);
        }
    }

    return total;
}


/* ================================================================== */
/* 5. Six arguments: Arity test + Compound branching                  */
/* ================================================================== */
int _05_six_args_compounds(int a, int b, int c, int d, int e, int f)
{
    int res = 0;

    if (a > b && c < d) {
        res = a + c;
    } else if (e == f) {
        res = e * 2;
    } else {
        res = b + d + f;
    }

    switch (f % 3) {
        case 0:  res += 10; break;
        case 1:  res += 20; break;
        default: res += 30; break;
    }

    return res;
}


/* ================================================================== */
/* 6. Single argument: Double Pointers + Do-While Loop                */
/* ================================================================== */
int _06_double_pointer_dowhile(int val)
{
    int local_val = val;
    int *ptr = &local_val;
    int **pptr = &ptr;

    int steps = 0;
    do {
        **pptr += 3;
        steps++;
    } while (**pptr < 20 && steps < 10);

    return **pptr;
}


/* ================================================================== */
/* 7. Six arguments: Array indexing + Pointers + Globals               */
/* ================================================================== */
int _07_six_args_array_globals(int a, int b, int c, int d, int e, int f)
{
    int local_arr[6] = {a, b, c, d, e, f};
    int *p = local_arr;
    int acc = 0;

    for (int i = 0; i < 6; i++) {
        if (*p % 2 == 0) {
            acc += *p + g_config[i % 4];
        } else {
            acc -= *p;
        }
        p++;
    }

    return acc;
}


/* ================================================================== */
/* 8. Two arguments: Goto-based Loop state machine                    */
/* ================================================================== */
int _08_goto_loop_statemachine(int start, int limit)
{
    int current = start;
    int accumulator = 0;

STATE_CHECK:
    if (current >= limit) goto STATE_END;

    if (current % 3 == 0) {
        accumulator += current * 2;
    } else {
        accumulator += current;
    }

    current++;
    goto STATE_CHECK;

STATE_END:
    return accumulator;
}


/* ================================================================== */
/* 9. Six arguments: Comprehensive feature integration                */
/* ================================================================== */
int _09_six_args_full_mix(int a, int b, int c, int d, int e, int f)
{
    int buffer[4] = {a, b, c, d};
    int *ptr = buffer;
    int sum = 0;

    // Switch on f
    switch (f & 1) {
        case 0:
            for (int i = 0; i < 4; i++) {
                sum += *(ptr + i);
            }
            break;
        case 1:
            if (e > 0) {
                sum = (a + b) * e;
            } else {
                goto FALLBACK;
            }
            break;
    }
    return sum + g_counter;

FALLBACK:
    sum = c + d + f;
    return sum;
}


/* ================================================================== */
/* Driver                                                             */
/* ================================================================== */
int main(int argc, char **argv)
{
    int seed = 4;

    if (argc > 1) {
        seed = atoi(argv[1]);
    }

    int test_arr[5] = {1, 2, 3, 4, 5};
    int total_result = 0;

    total_result += _00_no_args_globals();
    total_result += _01_loop_if_single_arg(seed);
    total_result += _02_pointer_array_two_args(test_arr, 5);
    total_result += _03_switch_goto(seed);
    total_result += _04_nested_loops_control(3, 4);
    total_result += _05_six_args_compounds(seed, seed + 1, seed + 2, seed + 3, seed + 4, seed + 5);
    total_result += _06_double_pointer_dowhile(seed);
    total_result += _07_six_args_array_globals(1, 2, 3, 4, 5, 6);
    total_result += _08_goto_loop_statemachine(1, seed + 5);
    total_result += _09_six_args_full_mix(seed, seed + 1, seed + 2, seed + 3, seed + 4, seed + 5);

    printf("%d\n", total_result);

    return 0;
}