#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

/* ================================================================== */
/* Globals                                                             */
/* ================================================================== */

int g_x = 10;
int g_y = -3;
int g_z = 7;
int g_n = 4;

int g_arr[8] = {
    0, 1, -2, 3, -4, 5, 6, -7
};

int g_mat[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

int g_void_result = 0;


/* ================================================================== */
/* 0-74: full IF corpus (same as the IF-only suite)                    */
/* ================================================================== */

int _0_if_only(int x)
{
    if (x > 0)
        return x * 2;

    return x;
}

int _1_if_else(int x)
{
    if (x > 0)
        return x + 10;
    else
        return x - 10;
}

int _2_if_with_surrounding_code(int x)
{
    int y = x + 3;

    if (x > 0)
        y *= 2;

    y += 5;
    return y;
}

int _3_if_compound(int x)
{
    int y = x;

    if (x > 0) {
        y += 10;
        y *= 2;
    }

    return y;
}

int _4_if_else_compound(int x)
{
    int y;

    if (x > 0) {
        y = x * 2;
        y += 1;
    } else {
        y = x - 2;
        y -= 1;
    }

    return y;
}

int _5_if_equal(int x, int y)
{
    if (x == y)
        return 100;

    return 200;
}

int _6_if_not_equal(int x, int y)
{
    if (x != y)
        return x + y;

    return x - y;
}

int _7_relational(int x, int y)
{
    if (x < y)
        return 1;

    if (x > y)
        return 2;

    if (x == y)
        return 3;

    return 4;
}

int _8_boolean_argument(bool cond, int x)
{
    if (cond)
        return x * 3;

    return x - 3;
}

int _9_if_elseif_else(int x)
{
    if (x > 10)
        return x + 100;
    else if (x > 5)
        return x + 50;
    else
        return x + 10;
}

int _10_multiple_elseif(int x)
{
    if (x < -10)
        return -1;
    else if (x < 0)
        return -2;
    else if (x == 0)
        return 0;
    else if (x < 10)
        return 2;
    else
        return 1;
}

int _11_elseif_expressions(int x, int y)
{
    if (x > y)
        return x * 2;
    else if (x == y)
        return x + y;
    else if (x + 10 > y)
        return x - y;
    else
        return y - x;
}

int _12_and(int a, int b)
{
    if (a > 0 && b > 0)
        return a + b;

    return a - b;
}

int _13_or(int a, int b)
{
    if (a > 0 || b > 0)
        return a + b + 10;

    return a + b - 10;
}

int _14_and_or(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c > 0)
        return 100;

    return 200;
}

int _15_or_and(int a, int b, int c)
{
    if ((a == 0 || b == 0) && c > 10)
        return 300;

    return 400;
}

int _16_complex_boolean(int a, int b, int c, int d)
{
    if ((a > 0 && b < 10) || (c == 5 && d != 0))
        return a + b + c + d;

    return a - b - c - d;
}

int _17_nested_arithmetic_condition(int a, int b, int c)
{
    if (a == (b + c / 10 * (a - 1)))
        return 111;

    return 222;
}

int _18_deep_parentheses(int a, int b, int c)
{
    if (((a + b) * (c - 1)) == ((a - (b + 2)) * c))
        return a + b + c;

    return a - b - c;
}

int _19_arithmetic_boolean(int a, int b, int c)
{
    if ((a + b > c) && ((a - b) < (c + 10)))
        return 123;

    return 456;
}

int _20_nested_boolean_parentheses(int a, int b, int c, int d)
{
    if (((a > b) && ((c < d) || (a == c))) ||
        ((b == d) && (a < c)))
        return 777;

    return 888;
}

int _21_nested_if(int x, int y)
{
    int result = x;

    if (x > 0) {
        if (y > 0)
            result += x + y;
        else
            result += x - y;
    }

    return result;
}

int _22_nested_in_else(int x, int y)
{
    if (x > 0) {
        return x + y;
    } else {
        if (y > 0)
            return y * 2;
        else
            return y - 2;
    }
}

int _23_nested_if_else(int x, int y, int z)
{
    if (x > 0) {
        if (y > 0) {
            return x + y;
        } else {
            return x - y;
        }
    } else {
        if (z > 0) {
            return z * 2;
        } else {
            return z - 2;
        }
    }
}

int _24_three_level_nesting(int a, int b, int c)
{
    int result = 0;

    if (a > 0) {
        result += 1;

        if (b > 0) {
            result += 10;

            if (c > 0)
                result += 100;
            else
                result -= 100;
        } else {
            result += 20;
        }
    } else {
        result = -1;
    }

    return result;
}

int _25_deep_nested_values(int a, int b, int c)
{
    int x = a + b;

    if (x > 0) {
        x += 10;

        if (x > c) {
            x *= 2;

            if ((x % 3) == 0)
                return x + 3;
            else
                return x - 3;
        } else {
            x -= 5;

            if (x < c)
                return x * 2;
            else
                return x / 2;
        }
    } else {
        return x - c;
    }
}

int _26_nested_and(int a, int b, int c)
{
    int result = 0;

    if (a > 0 && b > 0) {
        result += a;

        if (c > 0 && c < 10)
            result += b;
        else
            result -= b;
    } else {
        result = c;
    }

    return result;
}

int _27_nested_or(int a, int b, int c)
{
    if (a == 0 || b == 0) {
        if (c > 10 || c < -10)
            return 1000;

        return 2000;
    }

    return 3000;
}

int _28_nested_complex_boolean(int a, int b, int c, int d)
{
    if ((a > 0 && b > 0) || c == 0) {
        if ((d > 5 || a == b) && c < 10)
            return a + b + c + d;
        else
            return a * b;
    } else {
        return c - d;
    }
}

int _29_independent_ifs(int x)
{
    int result = x;

    if (x > 0)
        result += 10;

    if (x > 5)
        result += 20;

    if (x > 10)
        result += 30;

    return result;
}

int _30_independent_if_else(int x, int y)
{
    int result = 0;

    if (x > 0)
        result += 10;
    else
        result -= 10;

    if (y > 0)
        result += 20;
    else
        result -= 20;

    return result;
}

int _31_array_condition(int index)
{
    int value = g_arr[index];

    if (value > 0)
        return value * 2;

    return value - 2;
}

int _32_array_branches(int index)
{
    if (g_arr[index] > 0) {
        return g_arr[index] + g_arr[1];
    } else {
        return g_arr[index] - g_arr[2];
    }
}

int _33_array_complex_condition(int i, int j)
{
    if (g_arr[i] > g_arr[j] &&
        g_arr[i] != 0)
        return g_arr[i] * 10;

    return g_arr[j] * 10;
}

int _34_matrix_condition(int r, int c)
{
    int value = g_mat[r][c];

    if (value > 5)
        return value * 2;
    else
        return value - 2;
}

int _35_nested_array(int i, int j)
{
    int result = 0;

    if (i >= 0 && i < 8) {
        result += g_arr[i];

        if (j >= 0 && j < 8) {
            if (g_arr[i] > g_arr[j])
                result += g_arr[i] - g_arr[j];
            else
                result += g_arr[j] - g_arr[i];
        }
    }

    return result;
}

int _36_pointer_condition(int *p)
{
    if (*p > 10)
        return *p * 2;

    return *p + 2;
}

int _37_pointer_branches(int *p)
{
    if (*p == 0)
        return *p + 100;
    else
        return *p - 100;
}

int _38_pointer_array(int *p, int index)
{
    if (p[index] > g_arr[index])
        return p[index] + g_arr[index];

    return p[index] - g_arr[index];
}

int _39_nested_pointer(int *p, int x)
{
    int result = *p;

    if (*p > 0) {
        if (x > *p)
            result += x;
        else
            result -= x;
    } else {
        result = -*p;
    }

    return result;
}

int _40_pointer_write(int *p, int x)
{
    if (x > 0)
        *p = x * 2;
    else
        *p = x - 2;

    return *p;
}

int _41_pointer_write_nested(int *p, int x, int y)
{
    if (x > 0) {
        if (y > 0)
            *p = x + y;
        else
            *p = x - y;
    } else {
        *p = -x;
    }

    return *p;
}

int _42_global_only(void)
{
    if (g_x > 0)
        return g_x + g_y;

    return g_x - g_y;
}

int _43_global_and(void)
{
    if (g_x > 0 && g_y < 0)
        return g_x + g_y;

    return g_z;
}

int _44_global_or(void)
{
    if (g_x == 0 || g_z > 0)
        return g_x + g_z;

    return g_y;
}

int _45_global_nested(void)
{
    if (g_x > 0) {
        if (g_y > 0)
            return g_x + g_y;
        else
            return g_x - g_y;
    }

    return g_z;
}

int _46_global_array_only(void)
{
    if (g_arr[0] < g_arr[1])
        return g_arr[1];

    return g_arr[0];
}

int _47_global_matrix_only(void)
{
    if (g_mat[0][0] < g_mat[2][2])
        return g_mat[2][2];

    return g_mat[0][0];
}

int _48_multiple_returns(int x)
{
    if (x < 0)
        return -1;

    if (x == 0)
        return 0;

    if (x < 10)
        return 10;

    return 20;
}

int _49_nested_multiple_returns(int a, int b)
{
    if (a > 0) {
        if (b > 0)
            return a + b;

        if (b == 0)
            return a;

        return a - b;
    }

    return -a;
}

int _50_complex_multiple_returns(int a, int b, int c)
{
    if (a > 0 && b > 0)
        return a + b;

    if (a == 0 || c == 0)
        return a - c;

    if ((a + b) > (c * 2))
        return a * b;

    return c;
}

int _51_prefix_code(int a, int b, int c)
{
    int x = a + b;
    int y = x * 2;
    int z = y - c;

    if (z > 10)
        z += 100;
    else
        z -= 100;

    return z + x + y;
}

int _52_suffix_code(int a, int b)
{
    int result;

    if (a > b)
        result = a * 2;
    else
        result = b * 2;

    result += 10;
    result *= 3;

    return result;
}

int _53_prefix_nested_suffix(int a, int b, int c)
{
    int result = a + b;

    if (result > 0) {
        result *= 2;

        if (result > c)
            result += 10;
        else
            result -= 10;

        result += 5;
    } else {
        result = -result;
    }

    return result + c;
}

int _54_diamond(int a, int b)
{
    int result;

    if (a > b)
        result = a + 10;
    else
        result = b + 20;

    return result;
}

int _55_multiple_merge_values(int a, int b)
{
    int x;
    int y;

    if (a > 0) {
        x = a + 1;
        y = b + 2;
    } else {
        x = a - 1;
        y = b - 2;
    }

    return x * y;
}

int _56_nested_diamonds(int a, int b, int c)
{
    int x;
    int y;

    if (a > 0) {
        if (b > 0)
            x = a + b;
        else
            x = a - b;
    } else {
        if (c > 0)
            x = c + a;
        else
            x = c - a;
    }

    if (x > 10)
        y = x * 2;
    else
        y = x - 2;

    return y;
}

int _57_ternary_before_if(int a, int b)
{
    int x = (a > b) ? a : b;

    if (x > 10)
        return x * 2;

    return x + 2;
}

int _58_ternary_inside_if(int a, int b)
{
    if (a > 0)
        return (b > 0) ? a + b : a - b;
    else
        return (b > 0) ? b * 2 : b - 2;
}

int _59_nested_ternary_if(int a, int b, int c)
{
    int x = (a > b) ? ((a > c) ? a : c)
                   : ((b > c) ? b : c);

    if (x > 10)
        return x * 2;

    return x;
}

int _60_dynamic_alloca(int n, int x)
{
    if (n <= 0)
        return -1;

    int local[n];

    local[0] = x;

    if (n > 1)
        local[1] = x + 10;
    else
        local[0] += 10;

    if (local[0] > 0)
        return local[0];

    return local[0] - 1;
}

int _61_dynamic_alloca_pointer(int n, int x)
{
    if (n <= 0)
        return -1;

    int local[n];
    int *p = local;

    *p = x;

    if (n > 2) {
        p[1] = x + 1;

        if (p[1] > 0)
            return p[1] + p[0];
        else
            return p[0] - p[1];
    }

    return p[0];
}

int _62_dynamic_alloca_complex(int n, int a, int b)
{
    if (n <= 0)
        return -100;

    int values[n];

    values[0] = a + b;

    if (n > 3 && values[0] > 0)
        values[1] = values[0] * 2;
    else
        values[0] -= 5;

    if (values[0] > 10 || b == 0)
        return values[0];

    return values[0] + a;
}

int _63_malloc_if(int n, int x)
{
    if (n <= 0)
        return -1;

    int *p = malloc((size_t)n * sizeof(int));

    if (p == NULL)
        return -2;

    p[0] = x;

    if (p[0] > 0)
        p[0] *= 2;
    else
        p[0] -= 2;

    int result = p[0];

    free(p);
    return result;
}

int _64_malloc_nested_if(int n, int x, int y)
{
    if (n <= 0)
        return -1;

    int *p = malloc((size_t)n * sizeof(int));

    if (p == NULL)
        return -2;

    p[0] = x;

    if (x > 0) {
        if (y > 0)
            p[0] += y;
        else
            p[0] -= y;
    } else {
        p[0] = -p[0];
    }

    int result = p[0];

    free(p);
    return result;
}

void _65_void_if(int x)
{
    if (x > 0)
        g_void_result += x;
}

void _66_void_if_else(int x)
{
    if (x > 0)
        g_void_result += x * 2;
    else
        g_void_result -= x;
}

void _67_void_nested(int x, int y)
{
    if (x > 0) {
        if (y > 0)
            g_void_result += x + y;
        else
            g_void_result += x - y;
    } else {
        g_void_result -= x;
    }
}

void _68_void_complex(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c == 0)
        g_void_result += a + b + c;
    else
        g_void_result -= a + b + c;
}

void _69_void_global_only(void)
{
    if (g_x > 0 && g_y < 0)
        g_void_result += g_x;
    else
        g_void_result += g_z;
}

void _70_void_pointer(int *p, int x)
{
    if (x > 0)
        *p = x * 2;
    else
        *p = x - 2;

    g_void_result += *p;
}

void _71_void_array(int index, int value)
{
    if (index >= 0 && index < 8)
        g_arr[index] = value;

    if (index >= 0 && index < 8)
        g_void_result += g_arr[index];
}

int _72_complex_control_flow(int *p, int index, int a, int b)
{
    int result = g_x;

    if (a > b) {
        result += a;

        if (index >= 0 && index < 8) {
            if (g_arr[index] > 0) {
                result += g_arr[index];

                if (*p > 0 || g_y < 0)
                    return result + *p;
                else
                    return result - *p;
            } else {
                result -= g_arr[index];
            }
        } else {
            result += 100;
        }
    } else if (a == b) {
        result += g_z;

        if (*p == 0)
            return result;
        else
            return result + *p;
    } else {
        result -= b;

        if ((a + b) > (g_x + 1))
            return result * 2;

        return result / 2;
    }

    return result;
}

int _73_complex_merge(int a, int b, int c)
{
    int x;
    int y;

    if (a > 0 && b > 0) {
        x = a + b;

        if (c > 0)
            y = c + x;
        else
            y = c - x;
    } else {
        x = a - b;

        if (c == 0 || a == b)
            y = x * 2;
        else
            y = x - c;
    }

    if (y > 20)
        return y + 1;
    else if (y > 10)
        return y + 2;
    else
        return y + 3;
}

int _74_if_stress(int *p, int i, int a, int b, int c)
{
    int result = a + g_x;

    if ((a > b && c != 0) || (b > c && a != 0)) {
        result += 10;

        if (i >= 0 && i < 8) {
            if (g_arr[i] > result) {
                result += g_arr[i];

                if (*p > 0)
                    result += *p;
                else
                    result -= *p;
            } else {
                result -= g_arr[i];

                if (g_arr[i] == 0 || *p == 0)
                    result += 50;
            }
        } else {
            result -= 20;
        }
    } else {
        result -= 10;

        if (result > g_z) {
            if (a == (b + c / 10 * (a - 1)))
                return result + 100;
            else
                return result + 200;
        }
    }

    return (result > 0) ? result * 2 : -result;
}

/* ================================================================== */
/* 21. Loops                                                           */
/* ================================================================== */

/* 75: simple for loop */
int _75_for_simple(int n, int x)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += x + i;

    return sum;
}

/* 76: while loop */
int _76_while_simple(int n, int x)
{
    int sum = 0;
    int i = 0;

    while (i < n) {
        sum += x - i;
        i++;
    }

    return sum;
}

/* 77: do-while loop (always executes at least once) */
int _77_do_while(int n, int x)
{
    int sum = 0;
    int i = 0;

    do {
        sum += x + 2 * i;
        i++;
    } while (i < n);

    return sum;
}

/* 78: nested loops */
int _78_nested_loops(int n, int m)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            sum += i * j;
    }

    return sum;
}

/* 79: nested loops with if inside inner body */
int _79_nested_loop_if(int n, int m)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if ((i + j) % 2 == 0)
                result += i + j;
            else
                result -= 1;
        }
    }

    return result;
}

/* 80: break out of a loop */
int _80_break(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        if (i > 3)
            break;

        sum += i * 10;
    }

    return sum;
}

/* 81: continue inside a loop */
int _81_continue(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        if (i % 2 == 0)
            continue;

        sum += i;
    }

    return sum;
}

/* 82: loop with complex condition */
int _82_loop_complex_condition(int n, int x)
{
    int i = 0;
    int result = 0;

    while (i < n && (x > 0 || i < 3)) {
        result += (x > 0) ? x : -x;
        x /= 2;
        i++;
    }

    return result;
}

/* 83: loop over global array */
int _83_loop_global_array(void)
{
    int sum = 0;

    for (int i = 0; i < 8; i++) {
        if (g_arr[i] > 0)
            sum += g_arr[i];
        else
            sum -= g_arr[i];
    }

    return sum;
}

/* 84: loop with pointer walk */
int _84_loop_pointer(int n, int x)
{
    int buffer[8];
    int *p = buffer;
    int sum = 0;

    for (int i = 0; i < n && i < 8; i++) {
        *p = x + i;
        p++;
    }

    for (int i = 0; i < n && i < 8; i++)
        sum += buffer[i] * 2;

    return sum;
}

/* 85: code before, inside, and after the loop */
int _85_loop_surrounding_code(int n, int x)
{
    int pre = x * 2;
    int sum = 0;

    for (int i = 0; i < n; i++) {
        int inner = pre + i;

        if (inner > 10)
            inner *= 2;

        sum += inner;
    }

    sum += pre;

    if (sum > 100)
        sum -= 100;

    return sum;
}

/* 86: triple nested loops with conditionals */
int _86_triple_nested(int a, int b, int c)
{
    int result = 0;

    for (int i = 0; i < a; i++) {
        for (int j = 0; j < b; j++) {
            for (int k = 0; k < c; k++) {
                if (i > j && j > k)
                    result += 10;
                else if (i == j || j == k)
                    result += 1;
            }
        }
    }

    return result;
}

/* 87: OR chain + ternary per term (the requested style) */
int _87_if_OR3(int a, int b, int c)
{
    if (a > 0 || b > 0 || c > 0)
        return (a > 0 ? a : 0) + (b > 0 ? b : 0) + (c > 0 ? c : 0);

    return 0;
}

/* 88: OR chain + ternary, with dynamic alloca */
int _88_if_OR3_vla(int a, int b, int c)
{
    int size = (a > 0) ? a : ((b > 0) ? b : ((c > 0) ? c : 1));
    int local[size];

    local[0] = 0;

    if (a > 0 || b > 0 || c > 0)
        local[0] = (a > 0 ? a : 0) + (b > 0 ? b : 0) + (c > 0 ? c : 0);

    if (size > 1)
        local[1] = local[0] * 2;
    else
        local[1] = local[0] - 1;

    return local[0] + local[1];
}

/* ================================================================== */
/* 22. Loops + dynamic alloca                                          */
/* ================================================================== */

/* 89: loop writes the VLA, code after the loop reads it */
int _89_loop_vla(int n, int x)
{
    if (n <= 0)
        return -1;

    int local[n];
    int sum = 0;

    for (int i = 0; i < n; i++)
        local[i] = x + i;

    for (int i = 0; i < n; i++) {
        if (local[i] > 0)
            sum += local[i];
        else
            sum -= local[i];
    }

    return sum;
}

/* 90: nested loop over a VLA via pointer */
int _90_vla_nested_loop(int n, int x)
{
    if (n <= 0)
        return -1;

    int values[n];
    int *p = values;

    for (int i = 0; i < n; i++) {
        p[i] = 0;

        for (int j = 0; j <= i; j++)
            p[i] += x * (j + 1);
    }

    int total = 0;

    for (int i = 0; i < n; i++)
        total += p[i];

    return total;
}

/* 91: dynamic alloca INSIDE the loop body (one VLA per iteration) */
int _91_alloca_inside_loop(int n, int x)
{
    int total = 0;

    for (int i = 0; i < n && i < 4; i++) {
        int local[i + 1];

        for (int j = 0; j <= i; j++)
            local[j] = x + j;

        if (local[i] > 0)
            total += local[i];
        else
            total -= local[i];
    }

    return total;
}

/* 92: VLA size computed by an earlier loop + conditional use */
int _92_vla_size_from_loop(int n, int x)
{
    int size = 0;

    for (int i = 1; i <= n; i++) {
        if (i % 2 == 0)
            size += i;
        else
            size += 1;
    }

    int local[size];

    local[0] = x;

    for (int i = 1; i < size; i++)
        local[i] = local[i - 1] + i;

    if (local[size - 1] > local[0])
        return local[size - 1];

    return local[0];
}

/* ================================================================== */
/* 23. Globals + loops                                                 */
/* ================================================================== */

/* 93: global-only loop — NO locals */
int _93_global_loop(void)
{
    g_void_result = 0;

    for (int i = 0; i < g_n; i++) {
        if (g_x > 0)
            g_void_result += g_x + i;
        else
            g_void_result -= g_z;
    }

    return g_void_result;
}

/* 94: void loop function */
void _94_void_loop(int n, int x)
{
    for (int i = 0; i < n; i++) {
        if (x > 0)
            g_void_result += i;
        else
            g_void_result -= i;
    }
}

/* 95: void loop writing through a pointer */
void _95_void_loop_pointer(int *p, int n, int x)
{
    for (int i = 0; i < n; i++) {
        if (i % 2 == 0)
            p[i] = x + i;
        else
            p[i] = x - i;
    }

    for (int i = 0; i < n; i++)
        g_void_result += p[i];
}

/* ================================================================== */
/* 24. GOTO + everything                                               */
/* ================================================================== */

/* 96: goto used as loop break */
int _96_goto_break(int n, int x)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        if (x + i > 20)
            goto out;

        sum += x + i;
    }

out:
    return sum;
}

/* 97: nested goto inside loop + if */
int _97_goto_nested_loop(int n, int x)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        if (x > 0)
            goto pos;

        result -= i;
        continue;

pos:
        if (i % 2 == 0)
            goto even;

        result += i;
        continue;

even:
        result += i * 10;
    }

    return result;
}

/* 98: goto + VLA */
int _98_goto_vla(int n, int x)
{
    int local[n > 0 ? n : 1];   /* VLA declared before any goto */

    if (n <= 0)
        goto bad;

    local[0] = x;

    if (n > 2)
        goto big;

    local[0] += 10;
    goto check;

big:
    local[1] = x * 2;

check:
    if (local[0] > 0)
        goto pos;

    return local[0] - 1;

pos:
    return local[0];

bad:
    return -1;
}

/* 99: malloc + loop + if */
int _99_malloc_loop(int n, int x)
{
    if (n <= 0)
        return -1;

    int *p = malloc((size_t)n * sizeof(int));

    if (p == NULL)
        return -2;

    for (int i = 0; i < n; i++) {
        if (i % 2 == 0)
            p[i] = x + i;
        else
            p[i] = x - i;
    }

    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += p[i];

    free(p);
    return sum;
}

/* ================================================================== */
/* 25. Stress: everything combined                                     */
/* ================================================================== */

/*
 * 100: nested loops + ifs + arrays + pointers + globals + VLA.
 */
int _100_stress(int *p, int n, int a, int b)
{
    int result = g_x;

    int local[n > 0 ? n : 1];

    for (int i = 0; i < (n > 0 ? n : 1); i++)
        local[i] = a + i;

    for (int i = 0; i < (n > 0 ? n : 1); i++) {
        if (local[i] > b) {
            for (int j = 0; j < 8; j++) {
                if (g_arr[j] > 0 && (j % 2) == 0)
                    result += g_arr[j] - local[i];
                else if (p != NULL && *p > 0)
                    result += *p;
            }
        } else {
            result -= local[i];

            if ((a % 3) == (b + 10 / 2 * (a - 1)) % 3)
                result += 7;
        }
    }

    return (result > 0) ? result : -result;
}

/*
 * 101: high-density stress: loops + goto + ternary + globals + VLA
 *      + pointer writes.
 */
int _101_stress_goto(int *p, int n, int a, int b, int c)
{
    int result = a + g_x;

    int local[n > 0 ? n : 1];

    if ((a > b && c != 0) || (b > c && a != 0))
        goto outer;

    for (int i = 0; i < (n > 0 ? n : 1); i++)
        local[i] = -a + i;

    result -= local[0];
    goto final;

outer:
    for (int i = 0; i < (n > 0 ? n : 1); i++) {
        local[i] = b + i;

        if (local[i] > g_z) {
            if (*p > 0)
                result += local[i];
            else
                result -= local[i];
        } else {
            if (i == 0)
                goto skip;

            result += 1;
        }

skip:
        p[i % 4] = result;
    }

    if (result > g_z) {
        if (a == (b + c / 10 * (a - 1)))
            return result + 100;
        else
            return result + 200;
    }

final:
    return (result > 0) ? result * 2 : -result;
}

int _102_oneblock(int x){
    return (x==0)? true : false;
}

/* ================================================================== */
/* Driver                                                              */
/* ================================================================== */

int main(int argc, char **argv)
{
    int a = (argc > 1) ? atoi(argv[1]) : 4;

    int result = 0;

    /* ---------------- Minimal IFs ---------------- */
    result += _0_if_only(a);
    result += _1_if_else(a);
    result += _2_if_with_surrounding_code(a);
    result += _3_if_compound(a);
    result += _4_if_else_compound(a);

    /* ---------------- Simple conditions ---------------- */
    result += _5_if_equal(a, 4);
    result += _6_if_not_equal(a, 4);
    result += _7_relational(a, 4);
    result += _8_boolean_argument(a > 0, a);

    /* ---------------- Else-if ---------------- */
    result += _9_if_elseif_else(a);
    result += _10_multiple_elseif(a);
    result += _11_elseif_expressions(a, 4);

    /* ---------------- Logical conditions ---------------- */
    result += _12_and(a, 3);
    result += _13_or(a, -3);
    result += _14_and_or(a, 2, -1);
    result += _15_or_and(a, 0, 20);
    result += _16_complex_boolean(a, 3, 5, 1);

    /* ---------------- Arithmetic-heavy conditions ---------------- */
    result += _17_nested_arithmetic_condition(a, 1, 20);
    result += _18_deep_parentheses(a, 2, 3);
    result += _19_arithmetic_boolean(a, 2, 5);
    result += _20_nested_boolean_parentheses(a, 3, 5, 7);

    /* ---------------- Nested IFs ---------------- */
    result += _21_nested_if(a, 3);
    result += _22_nested_in_else(a, 3);
    result += _23_nested_if_else(a, 3, 5);
    result += _24_three_level_nesting(a, 3, 5);
    result += _25_deep_nested_values(a, 3, 10);

    result += _26_nested_and(a, 3, 5);
    result += _27_nested_or(a, 0, 20);
    result += _28_nested_complex_boolean(a, 3, 5, 7);

    /* ---------------- Independent IFs ---------------- */
    result += _29_independent_ifs(a);
    result += _30_independent_if_else(a, 3);

    /* ---------------- Arrays ---------------- */
    result += _31_array_condition(1);
    result += _32_array_branches(2);
    result += _33_array_complex_condition(1, 2);
    result += _34_matrix_condition(1, 1);
    result += _35_nested_array(1, 2);

    /* ---------------- Pointers ---------------- */
    int pointer_value = a;

    result += _36_pointer_condition(&pointer_value);
    result += _37_pointer_branches(&pointer_value);
    result += _38_pointer_array(g_arr, 1);
    result += _39_nested_pointer(&pointer_value, 3);

    pointer_value = a;
    result += _40_pointer_write(&pointer_value, a);

    pointer_value = a;
    result += _41_pointer_write_nested(&pointer_value, a, 3);

    /* ---------------- Global-only functions ---------------- */
    g_x = a;
    g_y = -3;
    g_z = 7;
    g_n = (a > 0 && a < 8) ? a : 4;

    result += _42_global_only();
    result += _43_global_and();
    result += _44_global_or();
    result += _45_global_nested();
    result += _46_global_array_only();
    result += _47_global_matrix_only();

    /* ---------------- Multiple returns ---------------- */
    result += _48_multiple_returns(a);
    result += _49_nested_multiple_returns(a, 3);
    result += _50_complex_multiple_returns(a, 3, 5);

    /* ---------------- Prefix / suffix ---------------- */
    result += _51_prefix_code(a, 2, 3);
    result += _52_suffix_code(a, 3);
    result += _53_prefix_nested_suffix(a, 3, 5);

    /* ---------------- Merged paths / PHIs ---------------- */
    result += _54_diamond(a, 3);
    result += _55_multiple_merge_values(a, 3);
    result += _56_nested_diamonds(a, 3, 5);

    /* ---------------- Ternary + IF ---------------- */
    result += _57_ternary_before_if(a, 3);
    result += _58_ternary_inside_if(a, 3);
    result += _59_nested_ternary_if(a, 3, 5);

    /* ---------------- Dynamic alloca / VLA ---------------- */
    result += _60_dynamic_alloca(4, a);
    result += _61_dynamic_alloca_pointer(5, a);
    result += _62_dynamic_alloca_complex(6, a, 3);

    /* ---------------- malloc ---------------- */
    result += _63_malloc_if(4, a);
    result += _64_malloc_nested_if(4, a, 3);

    /* ---------------- Void functions ---------------- */
    g_void_result = 0;

    _65_void_if(a);
    _66_void_if_else(a);
    _67_void_nested(a, 3);
    _68_void_complex(a, 3, 0);
    _69_void_global_only();

    pointer_value = a;
    _70_void_pointer(&pointer_value, a);
    _71_void_array(1, a);

    result += g_void_result;

    /* ---------------- IF stress ---------------- */
    pointer_value = a;
    result += _72_complex_control_flow(&pointer_value, 1, a, 3);
    result += _73_complex_merge(a, 3, 5);
    result += _74_if_stress(&pointer_value, 1, a, 3, 5);

    /* ---------------- Loops ---------------- */
    result += _75_for_simple(4, a);
    result += _76_while_simple(4, a);
    result += _77_do_while(4, a);
    result += _78_nested_loops(3, 4);
    result += _79_nested_loop_if(3, 4);
    result += _80_break(6);
    result += _81_continue(6);
    result += _82_loop_complex_condition(6, a);
    result += _83_loop_global_array();
    result += _84_loop_pointer(5, a);
    result += _85_loop_surrounding_code(4, a);
    result += _86_triple_nested(2, 3, 2);
    result += _87_if_OR3(a, 3, -5);
    result += _88_if_OR3_vla(a, 3, -5);

    /* ---------------- Loops + VLA ---------------- */
    result += _89_loop_vla(4, a);
    result += _90_vla_nested_loop(4, a);
    result += _91_alloca_inside_loop(4, a);
    result += _92_vla_size_from_loop(5, a);

    /* ---------------- Globals + loops ---------------- */
    result += _93_global_loop();

    g_void_result = 0;
    _94_void_loop(4, a);
    pointer_value = a;
    _95_void_loop_pointer(&pointer_value, 4, a);
    result += g_void_result;

    /* ---------------- GOTO + everything ---------------- */
    result += _96_goto_break(6, a);
    result += _97_goto_nested_loop(5, a);
    result += _98_goto_vla(4, a);
    result += _99_malloc_loop(4, a);

    /* ---------------- Final stress ---------------- */
    pointer_value = a;
    result += _100_stress(&pointer_value, 4, a, 3);

    pointer_value = a;
    result += _101_stress_goto(&pointer_value, 4, a, 3, 5);
    result += _102_oneblock(a);
    /* ---------------- Output ---------------- */
    printf("%d\n", result);

    return 0;
}