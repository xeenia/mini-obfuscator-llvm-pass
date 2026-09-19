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

int g_arr[8] = {
    0, 1, -2, 3, -4, 5, 6, -7
};

int g_mat[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

/*
 * Used by void functions so their effects are observable by the
 * differential-execution test.
 */
int g_void_result = 0;


/* ================================================================== */
/* 0. Minimal GOTOs                                                    */
/* ================================================================== */

/* 0: bare conditional goto */
int _00_goto_only(int x)
{
    int result = x;

    if (x > 0)
        goto positive;

    return result;

positive:
    return result * 2;
}


/* 1: goto with two labels */
int _01_goto_two_labels(int x)
{
    if (x > 0)
        goto big;

    goto small;

big:
    return x + 10;

small:
    return x - 10;
}


/* 2: goto with code before and after */
int _02_goto_surrounding_code(int x)
{
    int y = x + 3;

    if (x > 0)
        goto adjust;

    goto done;

adjust:
    y *= 2;
    goto done;

done:
    y += 5;
    return y;
}


/* 3: goto over a block */
int _03_goto_skip_block(int x)
{
    int y = x;

    if (x > 0)
        goto skip;

    y -= 100;

skip:
    y += 10;
    return y;
}


/* ================================================================== */
/* 1. Simple conditions                                                */
/* ================================================================== */

/* 4: equality */
int _04_goto_equal(int x, int y)
{
    if (x == y)
        goto eq;

    return 200;

eq:
    return 100;
}


/* 5: inequality */
int _05_goto_not_equal(int x, int y)
{
    if (x != y)
        goto neq;

    return x - y;

neq:
    return x + y;
}


/* 6: several relational operators */
int _06_relational(int x, int y)
{
    if (x < y)
        goto lt;

    if (x > y)
        goto gt;

    return 3;

lt:
    return 1;

gt:
    return 2;
}


/* 7: boolean argument */
int _07_boolean_argument(bool cond, int x)
{
    if (cond)
        goto true_case;

    return x - 3;

true_case:
    return x * 3;
}


/* ================================================================== */
/* 2. GOTOs acting like else-if chains                                 */
/* ================================================================== */

/* 8: chain of conditional gotos */
int _08_goto_chain(int x)
{
    if (x > 10)
        goto a;

    if (x > 5)
        goto b;

    return x + 10;

a:
    return x + 100;

b:
    return x + 50;
}


/* 9: multiple levels */
int _09_multiple_levels(int x)
{
    if (x < -10)
        goto l1;

    if (x < 0)
        goto l2;

    if (x == 0)
        goto l3;

    if (x < 10)
        goto l4;

    return 1;

l1:
    return -1;
l2:
    return -2;
l3:
    return 0;
l4:
    return 2;
}


/* 10: chain with different expressions */
int _10_goto_expressions(int x, int y)
{
    if (x > y)
        goto p;

    if (x == y)
        goto q;

    if (x + 10 > y)
        goto r;

    return y - x;

p:
    return x * 2;
q:
    return x + y;
r:
    return x - y;
}


/* ================================================================== */
/* 2. Logical conditions                                               */
/* ================================================================== */

/* 11: AND */
int _11_and(int a, int b)
{
    if (a > 0 && b > 0)
        goto both;

    return a - b;

both:
    return a + b;
}


/* 12: OR */
int _12_or(int a, int b)
{
    if (a > 0 || b > 0)
        goto any;

    return a + b - 10;

any:
    return a + b + 10;
}


/* 13: AND + OR */
int _13_and_or(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c > 0)
        goto hit;

    return 200;

hit:
    return 100;
}


/* 14: OR + AND */
int _14_or_and(int a, int b, int c)
{
    if ((a == 0 || b == 0) && c > 10)
        goto hit;

    return 400;

hit:
    return 300;
}


/*
 * 15: intentionally complicated short-circuit condition.
 */
int _15_complex_boolean(int a, int b, int c, int d)
{
    if ((a > 0 && b < 10) || (c == 5 && d != 0))
        goto complex_hit;

    return a - b - c - d;

complex_hit:
    return a + b + c + d;
}


/* ================================================================== */
/* 3. Parenthesized / arithmetic-heavy conditions                      */
/* ================================================================== */

/*
 * 16: deliberately nested arithmetic expression.
 *
 *     a == (b + c / 10 * (a - 1))
 */
int _16_nested_arithmetic_condition(int a, int b, int c)
{
    if (a == (b + c / 10 * (a - 1)))
        goto match;

    return 222;

match:
    return 111;
}


/* 17: several nested parentheses */
int _17_deep_parentheses(int a, int b, int c)
{
    if (((a + b) * (c - 1)) == ((a - (b + 2)) * c))
        goto match;

    return a - b - c;

match:
    return a + b + c;
}


/* 18: arithmetic + logical operators */
int _18_arithmetic_boolean(int a, int b, int c)
{
    if ((a + b > c) && ((a - b) < (c + 10)))
        goto hit;

    return 456;

hit:
    return 123;
}


/* 19: deeply parenthesized boolean condition */
int _19_nested_boolean_parentheses(int a, int b, int c, int d)
{
    if (((a > b) && ((c < d) || (a == c))) ||
        ((b == d) && (a < c)))
        goto hit;

    return 888;

hit:
    return 777;
}


/* ================================================================== */
/* 4. Nested GOTOs                                                     */
/* ================================================================== */

/* 20: one nested goto */
int _20_nested_goto(int x, int y)
{
    int result = x;

    if (x > 0)
        goto outer;

    return result;

outer:
    if (y > 0)
        goto inner_yes;

    result += x - y;
    return result;

inner_yes:
    result += x + y;
    return result;
}


/* 21: nested goto inside "else" path */
int _21_nested_in_else(int x, int y)
{
    if (x > 0)
        goto pos;

    if (y > 0)
        goto neg_y_pos;

    return y - 2;

pos:
    return x + y;

neg_y_pos:
    return y * 2;
}


/* 22: nested goto / else / else */
int _22_nested_goto_else(int x, int y, int z)
{
    if (x > 0)
        goto x_pos;

    if (z > 0)
        goto z_pos;

    return z - 2;

x_pos:
    if (y > 0)
        goto y_pos;

    return x - y;

y_pos:
    return x + y;

z_pos:
    return z * 2;
}


/* 23: three levels of nesting */
int _23_three_level_nesting(int a, int b, int c)
{
    int result = 0;

    if (a > 0)
        goto a_pos;

    return -1;

a_pos:
    result += 1;

    if (b > 0)
        goto b_pos;

    result += 20;
    return result;

b_pos:
    result += 10;

    if (c > 0)
        goto c_pos;

    result -= 100;
    return result;

c_pos:
    return result + 100;
}


/*
 * 24: deep nesting with conditions depending on values produced
 *     by previous blocks.
 */
int _24_deep_nested_values(int a, int b, int c)
{
    int x = a + b;

    if (x > 0)
        goto x_pos;

    return x - c;

x_pos:
    x += 10;

    if (x > c)
        goto x_gt_c;

    x -= 5;

    if (x < c)
        goto x_lt_c2;

    return x / 2;

x_lt_c2:
    return x * 2;

x_gt_c:
    x *= 2;

    if ((x % 3) == 0)
        goto div3;

    return x - 3;

div3:
    return x + 3;
}


/* ================================================================== */
/* 5. Nested GOTOs + complex conditions                                */
/* ================================================================== */

/* 25: nested goto with && */
int _25_nested_and(int a, int b, int c)
{
    int result = 0;

    if (a > 0 && b > 0)
        goto ab_pos;

    return c;

ab_pos:
    result += a;

    if (c > 0 && c < 10)
        goto c_small;

    result -= b;
    return result;

c_small:
    return result + b;
}


/* 26: nested goto with || */
int _26_nested_or(int a, int b, int c)
{
    if (a == 0 || b == 0)
        goto zero_ab;

    return 3000;

zero_ab:
    if (c > 10 || c < -10)
        goto c_extreme;

    return 2000;

c_extreme:
    return 1000;
}


/* 27: nested complex boolean expressions */
int _27_nested_complex_boolean(int a, int b, int c, int d)
{
    if ((a > 0 && b > 0) || c == 0)
        goto outer_hit;

    return c - d;

outer_hit:
    if ((d > 5 || a == b) && c < 10)
        goto inner_hit;

    return a * b;

inner_hit:
    return a + b + c + d;
}


/* ================================================================== */
/* 6. Multiple independent GOTOs                                       */
/* ================================================================== */

/* 28: independent conditional gotos */
int _28_independent_gotos(int x)
{
    int result = x;

    if (x > 0)
        goto add10;

    if (x > 5)
        goto add20;

    if (x > 10)
        goto add30;

    return result;

add10:
    result += 10;
    goto check20;

add20:
    result += 20;
    goto check30;

add30:
    result += 30;
    return result;

check20:
    if (x > 5)
        goto add20;

    goto check30;

check30:
    if (x > 10)
        goto add30;

    return result;
}


/* 29: independent gotos with different paths */
int _29_independent_goto_paths(int x, int y)
{
    int result = 0;

    if (x > 0)
        goto x_pos;

    result -= 10;
    goto check_y;

x_pos:
    result += 10;

check_y:
    if (y > 0)
        goto y_pos;

    return result - 20;

y_pos:
    return result + 20;
}


/* ================================================================== */
/* 7. Arrays                                                           */
/* ================================================================== */

/* 30: array element in condition */
int _30_array_condition(int index)
{
    int value = g_arr[index];

    if (value > 0)
        goto pos;

    return value - 2;

pos:
    return value * 2;
}


/* 31: array accesses in both branches */
int _31_array_branches(int index)
{
    if (g_arr[index] > 0)
        goto pos;

    return g_arr[index] - g_arr[2];

pos:
    return g_arr[index] + g_arr[1];
}


/* 32: array values combined in condition */
int _32_array_complex_condition(int i, int j)
{
    if (g_arr[i] > g_arr[j] &&
        g_arr[i] != 0)
        goto hit;

    return g_arr[j] * 10;

hit:
    return g_arr[i] * 10;
}


/* 33: two-dimensional array */
int _33_matrix_condition(int r, int c)
{
    int value = g_mat[r][c];

    if (value > 5)
        goto big;

    return value - 2;

big:
    return value * 2;
}


/* 34: array access inside nested goto body */
int _34_nested_array(int i, int j)
{
    int result = 0;

    if (i >= 0 && i < 8)
        goto i_ok;

    return 0;

i_ok:
    result += g_arr[i];

    if (j >= 0 && j < 8)
        goto j_ok;

    return result;

j_ok:
    if (g_arr[i] > g_arr[j])
        goto i_bigger;

    result += g_arr[j] - g_arr[i];
    return result;

i_bigger:
    return result + g_arr[i] - g_arr[j];
}


/* ================================================================== */
/* 8. Pointers                                                         */
/* ================================================================== */

/* 35: pointer value in condition */
int _35_pointer_condition(int *p)
{
    if (*p > 10)
        goto big;

    return *p + 2;

big:
    return *p * 2;
}


/* 36: pointer used in both branches */
int _36_pointer_branches(int *p)
{
    if (*p == 0)
        goto zero;

    return *p - 100;

zero:
    return *p + 100;
}


/* 37: pointer + array */
int _37_pointer_array(int *p, int index)
{
    if (p[index] > g_arr[index])
        goto bigger;

    return p[index] - g_arr[index];

bigger:
    return p[index] + g_arr[index];
}


/* 38: pointer condition + nested goto */
int _38_nested_pointer(int *p, int x)
{
    int result = *p;

    if (*p > 0)
        goto pos;

    return -result;

pos:
    if (x > *p)
        goto x_bigger;

    result -= x;
    return result;

x_bigger:
    return result + x;
}


/* ================================================================== */
/* 9. Pointer manipulation inside goto bodies                          */
/* ================================================================== */

/* 39: writes through pointer */
int _39_pointer_write(int *p, int x)
{
    if (x > 0)
        goto pos;

    *p = x - 2;
    goto end;

pos:
    *p = x * 2;

end:
    return *p;
}


/* 40: conditional pointer write + later read */
int _40_pointer_write_nested(int *p, int x, int y)
{
    if (x > 0)
        goto x_pos;

    *p = -x;
    goto end;

x_pos:
    if (y > 0)
        goto y_pos;

    *p = x - y;
    goto end;

y_pos:
    *p = x + y;

end:
    return *p;
}


/* ================================================================== */
/* 10. Globals only — NO local variables                               */
/* ================================================================== */

/* 41: global-only condition */
int _41_global_only(void)
{
    if (g_x > 0)
        goto pos;

    return g_x - g_y;

pos:
    return g_x + g_y;
}


/* 42: global-only AND */
int _42_global_and(void)
{
    if (g_x > 0 && g_y < 0)
        goto hit;

    return g_z;

hit:
    return g_x + g_y;
}


/* 43: global-only OR */
int _43_global_or(void)
{
    if (g_x == 0 || g_z > 0)
        goto hit;

    return g_y;

hit:
    return g_x + g_z;
}


/* 44: global-only nested goto */
int _44_global_nested(void)
{
    if (g_x > 0)
        goto x_pos;

    return g_z;

x_pos:
    if (g_y > 0)
        goto y_pos;

    return g_x - g_y;

y_pos:
    return g_x + g_y;
}


/* 45: global-only arrays */
int _45_global_array_only(void)
{
    if (g_arr[0] < g_arr[1])
        goto small;

    return g_arr[0];

small:
    return g_arr[1];
}


/* 46: global-only matrix */
int _46_global_matrix_only(void)
{
    if (g_mat[0][0] < g_mat[2][2])
        goto small;

    return g_mat[0][0];

small:
    return g_mat[2][2];
}


/* ================================================================== */
/* 11. Multiple returns                                                */
/* ================================================================== */

/* 47: multiple immediate returns via gotos */
int _47_multiple_returns(int x)
{
    if (x < 0)
        goto neg;

    if (x == 0)
        goto zero;

    if (x < 10)
        goto small;

    return 20;

neg:
    return -1;
zero:
    return 0;
small:
    return 10;
}


/* 48: nested multiple returns */
int _48_nested_multiple_returns(int a, int b)
{
    if (a > 0)
        goto a_pos;

    return -a;

a_pos:
    if (b > 0)
        goto b_pos;

    if (b == 0)
        goto b_zero;

    return a - b;

b_pos:
    return a + b;
b_zero:
    return a;
}


/* 49: complex condition + multiple returns */
int _49_complex_multiple_returns(int a, int b, int c)
{
    if (a > 0 && b > 0)
        goto ab;

    if (a == 0 || c == 0)
        goto ac;

    if ((a + b) > (c * 2))
        goto big;

    return c;

ab:
    return a + b;
ac:
    return a - c;
big:
    return a * b;
}


/* ================================================================== */
/* 12. Code before and after control flow                              */
/* ================================================================== */

/* 50: substantial code before goto */
int _50_prefix_code(int a, int b, int c)
{
    int x = a + b;
    int y = x * 2;
    int z = y - c;

    if (z > 10)
        goto big_z;

    z -= 100;
    goto end;

big_z:
    z += 100;

end:
    return z + x + y;
}


/* 51: code after goto */
int _51_suffix_code(int a, int b)
{
    int result;

    if (a > b)
        goto a_bigger;

    result = b * 2;
    goto cont;

a_bigger:
    result = a * 2;

cont:
    result += 10;
    result *= 3;
    return result;
}


/* 52: code before, nested goto, and code after */
int _52_prefix_nested_suffix(int a, int b, int c)
{
    int result = a + b;

    if (result > 0)
        goto pos;

    result = -result;
    goto end;

pos:
    result *= 2;

    if (result > c)
        goto gt_c;

    result -= 10;
    goto cont;

gt_c:
    result += 10;

cont:
    result += 5;

end:
    return result + c;
}


/* ================================================================== */
/* 13. Merged paths / PHI-producing structures                         */
/* ================================================================== */

/* 53: classic diamond */
int _53_diamond(int a, int b)
{
    int result;

    if (a > b)
        goto a_bigger;

    result = b + 20;
    goto end;

a_bigger:
    result = a + 10;

end:
    return result;
}


/* 54: multiple values assigned through different branches */
int _54_multiple_merge_values(int a, int b)
{
    int x;
    int y;

    if (a > 0)
        goto pos;

    x = a - 1;
    y = b - 2;
    goto end;

pos:
    x = a + 1;
    y = b + 2;

end:
    return x * y;
}


/* 55: nested diamonds */
int _55_nested_diamonds(int a, int b, int c)
{
    int x;
    int y;

    if (a > 0)
        goto a_pos;

    if (c > 0)
        goto c_pos;

    x = c - a;
    goto check;

c_pos:
    x = c + a;
    goto check;

a_pos:
    if (b > 0)
        goto b_pos;

    x = a - b;
    goto check;

b_pos:
    x = a + b;

check:
    if (x > 10)
        goto x_big;

    y = x - 2;
    return y;

x_big:
    y = x * 2;
    return y;
}


/* ================================================================== */
/* 14. ?: mixed with GOTO                                              */
/* ================================================================== */

/* 56: ternary before goto */
int _56_ternary_before_goto(int a, int b)
{
    int x = (a > b) ? a : b;

    if (x > 10)
        goto big;

    return x + 2;

big:
    return x * 2;
}


/* 57: ternary inside goto branches */
int _57_ternary_inside_goto(int a, int b)
{
    if (a > 0)
        goto pos;

    return (b > 0) ? b * 2 : b - 2;

pos:
    return (b > 0) ? a + b : a - b;
}


/* 58: nested ternary expressions with a goto */
int _58_nested_ternary_goto(int a, int b, int c)
{
    int x = (a > b) ? ((a > c) ? a : c)
                   : ((b > c) ? b : c);

    if (x > 10)
        goto big;

    return x;

big:
    return x * 2;
}


/* ================================================================== */
/* 15. Dynamic alloca / VLA                                            */
/* ================================================================== */

/* 59: runtime-sized local array */
int _59_dynamic_alloca(int n, int x)
{
    int local[n];

    if (n <= 0)
        goto bad_n;

    local[0] = x;

    if (n > 1)
        goto n_big;

    local[0] += 10;
    goto check;

n_big:
    local[1] = x + 10;

check:
    if (local[0] > 0)
        goto pos;

    return local[0] - 1;

pos:
    return local[0];

bad_n:
    return -1;
}


/* 60: VLA + nested goto + pointer into the VLA */
int _60_dynamic_alloca_pointer(int n, int x)
{
    int local[n];
    int *p;

    if (n <= 0)
        goto bad_n;

    p = local;
    *p = x;

    if (n > 2)
        goto n_big;

    return p[0];

n_big:
    p[1] = x + 1;

    if (p[1] > 0)
        goto p1_pos;

    return p[0] - p[1];

p1_pos:
    return p[1] + p[0];

bad_n:
    return -1;
}


/* 61: VLA where the runtime size affects conditional behavior */
int _61_dynamic_alloca_complex(int n, int a, int b)
{
    int values[n];

    if (n <= 0)
        goto bad_n;

    values[0] = a + b;

    if (n > 3 && values[0] > 0)
        goto big;

    values[0] -= 5;
    goto check;

big:
    values[1] = values[0] * 2;

check:
    if (values[0] > 10 || b == 0)
        goto hit;

    return values[0] + a;

hit:
    return values[0];

bad_n:
    return -100;
}


/* ================================================================== */
/* 16. malloc + goto                                                   */
/* ================================================================== */

/* 62: malloc + goto */
int _62_malloc_goto(int n, int x)
{
    int *p;
    int result;

    if (n <= 0)
        goto bad_n;

    p = malloc((size_t)n * sizeof(int));

    if (p == NULL)
        goto alloc_fail;

    p[0] = x;

    if (p[0] > 0)
        goto pos;

    p[0] -= 2;
    goto end;

pos:
    p[0] *= 2;

end:
    result = p[0];
    free(p);
    return result;

alloc_fail:
    return -2;

bad_n:
    return -1;
}


/* 63: malloc + nested goto */
int _63_malloc_nested_goto(int n, int x, int y)
{
    int *p;
    int result;

    if (n <= 0)
        goto bad_n;

    p = malloc((size_t)n * sizeof(int));

    if (p == NULL)
        goto alloc_fail;

    p[0] = x;

    if (x > 0)
        goto x_pos;

    p[0] = -p[0];
    goto end;

x_pos:
    if (y > 0)
        goto y_pos;

    p[0] -= y;
    goto end;

y_pos:
    p[0] += y;

end:
    result = p[0];
    free(p);
    return result;

alloc_fail:
    return -2;

bad_n:
    return -1;
}


/* ================================================================== */
/* 17. Void functions                                                  */
/* ================================================================== */

/* 64: simple void goto */
void _64_void_goto(int x)
{
    if (x > 0)
        goto pos;

    return;

pos:
    g_void_result += x;
}


/* 65: void goto / "else" */
void _65_void_goto_else(int x)
{
    if (x > 0)
        goto pos;

    g_void_result -= x;
    return;

pos:
    g_void_result += x * 2;
}


/* 66: void nested goto */
void _66_void_nested(int x, int y)
{
    if (x > 0)
        goto x_pos;

    g_void_result -= x;
    return;

x_pos:
    if (y > 0)
        goto y_pos;

    g_void_result += x - y;
    return;

y_pos:
    g_void_result += x + y;
}


/* 67: void complex condition */
void _67_void_complex(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c == 0)
        goto hit;

    g_void_result -= a + b + c;
    return;

hit:
    g_void_result += a + b + c;
}


/* 68: void global-only function — no locals */
void _68_void_global_only(void)
{
    if (g_x > 0 && g_y < 0)
        goto hit;

    g_void_result += g_z;
    return;

hit:
    g_void_result += g_x;
}


/* ================================================================== */
/* 18. Void functions with pointer / array effects                     */
/* ================================================================== */

/* 69: void pointer write */
void _69_void_pointer(int *p, int x)
{
    if (x > 0)
        goto pos;

    *p = x - 2;
    goto done;

pos:
    *p = x * 2;

done:
    g_void_result += *p;
}


/* 70: void array modification */
void _70_void_array(int index, int value)
{
    if (index >= 0 && index < 8)
        goto in_range;

    goto done;

in_range:
    g_arr[index] = value;

    if (index >= 0 && index < 8)
        goto read_back;

    goto done;

read_back:
    g_void_result += g_arr[index];

done:
    return;
}


/* ================================================================== */
/* 19. Final complicated goto-only cases                               */
/* ================================================================== */

/* 71: deeply nested goto + array + pointer + globals */
int _71_complex_control_flow(int *p, int index, int a, int b)
{
    int result = g_x;

    if (a > b)
        goto a_bigger;

    if (a == b)
        goto a_equal;

    result -= b;

    if ((a + b) > (g_x + 1))
        goto double_it;

    return result / 2;

double_it:
    return result * 2;

a_equal:
    result += g_z;

    if (*p == 0)
        goto p_zero;

    return result + *p;

p_zero:
    return result;

a_bigger:
    result += a;

    if (index >= 0 && index < 8)
        goto index_ok;

    result += 100;
    return result;

index_ok:
    if (g_arr[index] > 0)
        goto arr_pos;

    result -= g_arr[index];
    return result;

arr_pos:
    result += g_arr[index];

    if (*p > 0 || g_y < 0)
        goto p_pos;

    return result - *p;

p_pos:
    return result + *p;
}


/*
 * 72: complicated merged control flow.
 *
 * Multiple assignments converge into the final return.
 */
int _72_complex_merge(int a, int b, int c)
{
    int x;
    int y;

    if (a > 0 && b > 0)
        goto ab_pos;

    x = a - b;

    if (c == 0 || a == b)
        goto y_double;

    y = x - c;
    goto check;

y_double:
    y = x * 2;
    goto check;

ab_pos:
    x = a + b;

    if (c > 0)
        goto c_pos;

    y = c - x;
    goto check;

c_pos:
    y = c + x;

check:
    if (y > 20)
        goto y20;

    if (y > 10)
        goto y10;

    return y + 3;

y20:
    return y + 1;
y10:
    return y + 2;
}


/*
 * 73: intentionally high-density goto case.
 *
 * This is the "stress" case for the goto-only corpus.
 */
int _73_goto_stress(int *p, int i, int a, int b, int c)
{
    int result = a + g_x;

    if ((a > b && c != 0) || (b > c && a != 0))
        goto outer_hit;

    result -= 10;

    if (result > g_z)
        goto big_result;

    goto final;

big_result:
    if (a == (b + c / 10 * (a - 1)))
        goto special;

    return result + 200;

special:
    return result + 100;

outer_hit:
    result += 10;

    if (i >= 0 && i < 8)
        goto i_ok;

    result -= 20;
    goto final;

i_ok:
    if (g_arr[i] > result)
        goto arr_big;

    result -= g_arr[i];

    if (g_arr[i] == 0 || *p == 0)
        goto add50;

    goto final;

add50:
    result += 50;
    goto final;

arr_big:
    result += g_arr[i];

    if (*p > 0)
        goto p_pos;

    result -= *p;
    goto final;

p_pos:
    result += *p;

final:
    return (result > 0) ? result * 2 : -result;
}


/* ================================================================== */
/* Driver                                                              */
/* ================================================================== */

int main(int argc, char **argv)
{
    /*
     * One externally controlled value makes differential testing easy:
     *
     *     ./test 5
     *     ./test -3
     *     ./test 20
     */
    int a = (argc > 1) ? atoi(argv[1]) : 4;

    int result = 0;

    /* ---------------- Minimal GOTOs ---------------- */
    result += _00_goto_only(a);
    result += _01_goto_two_labels(a);
    result += _02_goto_surrounding_code(a);
    result += _03_goto_skip_block(a);

    /* ---------------- Simple conditions ---------------- */
    result += _04_goto_equal(a, 4);
    result += _05_goto_not_equal(a, 4);
    result += _06_relational(a, 4);
    result += _07_boolean_argument(a > 0, a);

    /* ---------------- Goto chains ---------------- */
    result += _08_goto_chain(a);
    result += _09_multiple_levels(a);
    result += _10_goto_expressions(a, 4);

    /* ---------------- Logical conditions ---------------- */
    result += _11_and(a, 3);
    result += _12_or(a, -3);
    result += _13_and_or(a, 2, -1);
    result += _14_or_and(a, 0, 20);
    result += _15_complex_boolean(a, 3, 5, 1);

    /* ---------------- Arithmetic-heavy conditions ---------------- */
    result += _16_nested_arithmetic_condition(a, 1, 20);
    result += _17_deep_parentheses(a, 2, 3);
    result += _18_arithmetic_boolean(a, 2, 5);
    result += _19_nested_boolean_parentheses(a, 3, 5, 7);

    /* ---------------- Nested GOTOs ---------------- */
    result += _20_nested_goto(a, 3);
    result += _21_nested_in_else(a, 3);
    result += _22_nested_goto_else(a, 3, 5);
    result += _23_three_level_nesting(a, 3, 5);
    result += _24_deep_nested_values(a, 3, 10);

    result += _25_nested_and(a, 3, 5);
    result += _26_nested_or(a, 0, 20);
    result += _27_nested_complex_boolean(a, 3, 5, 7);

    /* ---------------- Independent GOTOs ---------------- */
    result += _28_independent_gotos(a);
    result += _29_independent_goto_paths(a, 3);

    /* ---------------- Arrays ---------------- */
    result += _30_array_condition(1);
    result += _31_array_branches(2);
    result += _32_array_complex_condition(1, 2);
    result += _33_matrix_condition(1, 1);
    result += _34_nested_array(1, 2);

    /* ---------------- Pointers ---------------- */
    int pointer_value = a;

    result += _35_pointer_condition(&pointer_value);
    result += _36_pointer_branches(&pointer_value);
    result += _37_pointer_array(g_arr, 1);
    result += _38_nested_pointer(&pointer_value, 3);

    pointer_value = a;
    result += _39_pointer_write(&pointer_value, a);

    pointer_value = a;
    result += _40_pointer_write_nested(&pointer_value, a, 3);

    /* ---------------- Global-only functions ---------------- */
    g_x = a;
    g_y = -3;
    g_z = 7;

    result += _41_global_only();
    result += _42_global_and();
    result += _43_global_or();
    result += _44_global_nested();
    result += _45_global_array_only();
    result += _46_global_matrix_only();

    /* ---------------- Multiple returns ---------------- */
    result += _47_multiple_returns(a);
    result += _48_nested_multiple_returns(a, 3);
    result += _49_complex_multiple_returns(a, 3, 5);

    /* ---------------- Prefix / suffix ---------------- */
    result += _50_prefix_code(a, 2, 3);
    result += _51_suffix_code(a, 3);
    result += _52_prefix_nested_suffix(a, 3, 5);

    /* ---------------- Merged paths / PHIs ---------------- */
    result += _53_diamond(a, 3);
    result += _54_multiple_merge_values(a, 3);
    result += _55_nested_diamonds(a, 3, 5);

    /* ---------------- Ternary + goto ---------------- */
    result += _56_ternary_before_goto(a, 3);
    result += _57_ternary_inside_goto(a, 3);
    result += _58_nested_ternary_goto(a, 3, 5);

    /* ---------------- Dynamic alloca / VLA ---------------- */
    result += _59_dynamic_alloca(4, a);
    result += _60_dynamic_alloca_pointer(5, a);
    result += _61_dynamic_alloca_complex(6, a, 3);

    /* ---------------- malloc ---------------- */
    result += _62_malloc_goto(4, a);
    result += _63_malloc_nested_goto(4, a, 3);

    /* ---------------- Void functions ---------------- */
    g_void_result = 0;

    _64_void_goto(a);
    _65_void_goto_else(a);
    _66_void_nested(a, 3);
    _67_void_complex(a, 3, 0);
    _68_void_global_only();

    pointer_value = a;
    _69_void_pointer(&pointer_value, a);

    _70_void_array(1, a);

    result += g_void_result;

    /* ---------------- Complex cases ---------------- */
    pointer_value = a;

    result += _71_complex_control_flow(
        &pointer_value, 1, a, 3
    );

    result += _72_complex_merge(a, 3, 5);

    result += _73_goto_stress(
        &pointer_value, 1, a, 3, 5
    );

    /* ---------------- Differential-testing output ---------------- */
    printf("%d\n", result);

    return 0;
}