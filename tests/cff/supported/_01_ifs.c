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
/* 0. Minimal IFs                                                      */
/* ================================================================== */

/* 0: bare if, no else */
int _00_if_only(int x)
{
    if (x > 0)
        return x * 2;

    return x;
}


/* 1: if / else */
int _01_if_else(int x)
{
    if (x > 0)
        return x + 10;
    else
        return x - 10;
}


/* 2: if with code before and after */
int _02_if_with_surrounding_code(int x)
{
    int y = x + 3;

    if (x > 0)
        y *= 2;

    y += 5;
    return y;
}


/* 3: if with explicit compound blocks */
int _03_if_compound(int x)
{
    int y = x;

    if (x > 0) {
        y += 10;
        y *= 2;
    }

    return y;
}


/* 4: if / else with compound blocks */
int _04_if_else_compound(int x)
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


/* ================================================================== */
/* 1. Simple conditions                                                */
/* ================================================================== */

/* 5: equality */
int _05_if_equal(int x, int y)
{
    if (x == y)
        return 100;

    return 200;
}


/* 6: inequality */
int _06_if_not_equal(int x, int y)
{
    if (x != y)
        return x + y;

    return x - y;
}


/* 7: several relational operators */
int _07_relational(int x, int y)
{
    if (x < y)
        return 1;

    if (x > y)
        return 2;

    if (x == y)
        return 3;

    return 4;
}


/* 8: boolean argument */
int _08_boolean_argument(bool cond, int x)
{
    if (cond)
        return x * 3;

    return x - 3;
}


/* ================================================================== */
/* 2. IF / ELSE-IF / ELSE                                              */
/* ================================================================== */

/* 9: classic if / else-if / else */
int _09_if_elseif_else(int x)
{
    if (x > 10)
        return x + 100;
    else if (x > 5)
        return x + 50;
    else
        return x + 10;
}


/* 10: multiple else-if levels */
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


/* 11: else-if with different expressions */
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


/* ================================================================== */
/* 3. Logical conditions                                                */
/* ================================================================== */

/* 12: AND */
int _12_and(int a, int b)
{
    if (a > 0 && b > 0)
        return a + b;

    return a - b;
}


/* 13: OR */
int _13_or(int a, int b)
{
    if (a > 0 || b > 0)
        return a + b + 10;

    return a + b - 10;
}


/* 14: AND + OR */
int _14_and_or(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c > 0)
        return 100;

    return 200;
}


/* 15: OR + AND */
int _15_or_and(int a, int b, int c)
{
    if ((a == 0 || b == 0) && c > 10)
        return 300;

    return 400;
}


/*
 * 16: intentionally complicated short-circuit condition.
 *
 */
int _16_complex_boolean(int a, int b, int c, int d)
{
    if ((a > 0 && b < 10) || (c == 5 && d != 0))
        return a + b + c + d;

    return a - b - c - d;
}


/* ================================================================== */
/* 4. Parenthesized / arithmetic-heavy conditions                      */
/* ================================================================== */

/*
 * 17: deliberately nested arithmetic expression.
 *
 * The important structure is:
 *
 *     a == (b + c / 10 * (a - 1))
 */
int _17_nested_arithmetic_condition(int a, int b, int c)
{
    if (a ==  (b + c / 10 * (a - 1)))
        return 111;

    return 222;
}


/* 18: several nested parentheses */
int _18_deep_parentheses(int a, int b, int c)
{
    if (((a + b) * (c - 1)) == ((a - (b + 2)) * c))
        return a + b + c;

    return a - b - c;
}


/* 19: arithmetic + logical operators */
int _19_arithmetic_boolean(int a, int b, int c)
{
    if ((a + b > c) && ((a - b) < (c + 10)))
        return 123;

    return 456;
}


/* 20: deeply parenthesized boolean condition */
int _20_nested_boolean_parentheses(int a, int b, int c, int d)
{
    if (((a > b) && ((c < d) || (a == c))) ||
        ((b == d) && (a < c)))
        return 777;

    return 888;
}


/* ================================================================== */
/* 5. Nested IFs                                                       */
/* ================================================================== */

/* 21: one nested if */
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


/* 22: nested if inside else */
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


/* 23: nested if / else / else */
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


/* 24: three levels of nesting */
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


/*
 * 25: deep nesting with conditions depending on values produced
 *     by previous blocks.
 */
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


/* ================================================================== */
/* 6. Nested IFs + complex conditions                                  */
/* ================================================================== */

/* 26: nested IF with && */
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


/* 27: nested IF with || */
int _27_nested_or(int a, int b, int c)
{
    if (a ==  0 || b == 0) {
        if (c > 10 || c < -10)
            return 1000;

        return 2000;
    }

    return 3000;
}


/* 28: nested complex boolean expressions */
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


/* ================================================================== */
/* 7. Multiple independent IFs                                         */
/* ================================================================== */

/*
 * 29: independent IFs.
 */
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


/* 30: independent IFs with different paths */
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


/* ================================================================== */
/* 8. Arrays                                                            */
/* ================================================================== */

/* 31: array element in condition */
int _31_array_condition(int index)
{
    int value = g_arr[index];

    if (value > 0)
        return value * 2;

    return value - 2;
}


/* 32: array accesses in both branches */
int _32_array_branches(int index)
{
    if (g_arr[index] > 0) {
        return g_arr[index] + g_arr[1];
    } else {
        return g_arr[index] - g_arr[2];
    }
}


/* 33: array values combined in condition */
int _33_array_complex_condition(int i, int j)
{
    if (g_arr[i] > g_arr[j] &&
        g_arr[i] != 0)
        return g_arr[i] * 10;

    return g_arr[j] * 10;
}


/* 34: two-dimensional array */
int _34_matrix_condition(int r, int c)
{
    int value = g_mat[r][c];

    if (value > 5)
        return value * 2;
    else
        return value - 2;
}


/* 35: array access inside nested IF body */
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


/* ================================================================== */
/* 9. Pointers                                                          */
/* ================================================================== */

/* 36: pointer value in condition */
int _36_pointer_condition(int *p)
{
    if (*p > 10)
        return *p * 2;

    return *p + 2;
}


/* 37: pointer used in both branches */
int _37_pointer_branches(int *p)
{
    if (*p == 0)
        return *p + 100;
    else
        return *p - 100;
}


/* 38: pointer + array */
int _38_pointer_array(int *p, int index)
{
    if (p[index] > g_arr[index])
        return p[index] + g_arr[index];

    return p[index] - g_arr[index];
}


/* 39: pointer condition + nested IF */
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


/* ================================================================== */
/* 10. Pointer manipulation inside IF bodies                            */
/* ================================================================== */

/* 40: writes through pointer */
int _40_pointer_write(int *p, int x)
{
    if (x > 0)
        *p = x * 2;
    else
        *p = x - 2;

    return *p;
}


/* 41: conditional pointer write + later read */
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


/* ================================================================== */
/* 11. Globals only — NO local variables                               */
/* ================================================================== */


/* 42: global-only condition */
int _42_global_only(void)
{
    if (g_x > 0)
        return g_x + g_y;

    return g_x - g_y;
}


/* 43: global-only AND */
int _43_global_and(void)
{
    if (g_x > 0 && g_y < 0)
        return g_x + g_y;

    return g_z;
}


/* 44: global-only OR */
int _44_global_or(void)
{
    if (g_x == 0 || g_z > 0)
        return g_x + g_z;

    return g_y;
}


/* 45: global-only nested IF */
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


/* 46: global-only arrays */
int _46_global_array_only(void)
{
    if (g_arr[0] < g_arr[1])
        return g_arr[1];

    return g_arr[0];
}


/* 47: global-only matrix */
int _47_global_matrix_only(void)
{
    if (g_mat[0][0] < g_mat[2][2])
        return g_mat[2][2];

    return g_mat[0][0];
}


/* ================================================================== */
/* 12. Multiple returns                                                 */
/* ================================================================== */

/* 48: multiple immediate returns */
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


/* 49: nested multiple returns */
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


/* 50: complex condition + multiple returns */
int _50_complex_multiple_returns(int a, int b, int c)
{
    if (a > 0 && b > 0)
        return a + b;

    if (a ==  0 || c == 0)
        return a - c;

    if ((a + b) > (c * 2))
        return a * b;

    return c;
}


/* ================================================================== */
/* 13. Code before and after control flow                               */
/* ================================================================== */

/* 51: substantial code before IF */
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


/* 52: code after IF */
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


/* 53: code before, nested IF, and code after */
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


/* ================================================================== */
/* 14. Merged paths / PHI-producing structures                         */
/* ================================================================== */

/*
 * 54: classic diamond.
 */
int _54_diamond(int a, int b)
{
    int result;

    if (a > b)
        result = a + 10;
    else
        result = b + 20;

    return result;
}


/*
 * 55: multiple values assigned through different branches.
 */
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


/*
 * 56: nested diamonds.
 */
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


/* ================================================================== */
/* 15. ?: mixed with IF                                                */
/* ================================================================== */

/* 57: ternary before IF */
int _57_ternary_before_if(int a, int b)
{
    int x = (a > b) ? a : b;

    if (x > 10)
        return x * 2;

    return x + 2;
}


/* 58: ternary inside IF branches */
int _58_ternary_inside_if(int a, int b)
{
    if (a > 0)
        return (b > 0) ? a + b : a - b;
    else
        return (b > 0) ? b * 2 : b - 2;
}


/* 59: nested ternary expressions with an IF */
int _59_nested_ternary_if(int a, int b, int c)
{
    int x = (a > b) ? ((a > c) ? a : c)
                   : ((b > c) ? b : c);

    if (x > 10)
        return x * 2;

    return x;
}


/* ================================================================== */
/* 16. Dynamic alloca / VLA                                             */
/* ================================================================== */

/*
 * 60: runtime-sized local array.
 
 */
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


/*
 * 61: VLA + nested IF + pointer into the VLA.
 *
 * Again, n is runtime-sized.
 */
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


/*
 * 62: VLA where the runtime size affects conditional behavior.
 */
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


/* ================================================================== */
/* 17. malloc + IF                                                      */
/* ================================================================== */

/*
 * malloc does NOT create an LLVM alloca.
 *
 * It tests heap allocation combined with control flow, whereas the
 * VLA tests dynamic alloca.
 */
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


/*
 * 64: malloc + nested IF.
 */
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


/* ================================================================== */
/* 18. Void functions                                                   */
/* ================================================================== */

/*
 * Void functions cannot return a value, so they modify g_void_result.
 *
 * The driver includes g_void_result in the final observable result.
 */

/* 65: simple void IF */
void _65_void_if(int x)
{
    if (x > 0)
        g_void_result += x;
}


/* 66: void IF / ELSE */
void _66_void_if_else(int x)
{
    if (x > 0)
        g_void_result += x * 2;
    else
        g_void_result -= x;
}


/* 67: void nested IF */
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


/* 68: void complex condition */
void _68_void_complex(int a, int b, int c)
{
    if ((a > 0 && b > 0) || c == 0)
        g_void_result += a + b + c;
    else
        g_void_result -= a + b + c;
}


/* 69: void global-only function — no locals */
void _69_void_global_only(void)
{
    if (g_x > 0 && g_y < 0)
        g_void_result += g_x;
    else
        g_void_result += g_z;
}


/* ================================================================== */
/* 19. Void functions with pointer / array effects                      */
/* ================================================================== */

/* 70: void pointer write */
void _70_void_pointer(int *p, int x)
{
    if (x > 0)
        *p = x * 2;
    else
        *p = x - 2;

    g_void_result += *p;
}


/* 71: void array modification */
void _71_void_array(int index, int value)
{
    if (index >= 0 && index < 8)
        g_arr[index] = value;

    if (index >= 0 && index < 8)
        g_void_result += g_arr[index];
}


/* ================================================================== */
/* 20. Final complicated IF-only cases                                  */
/* ================================================================== */

/*
 * 72: deeply nested IF + array + pointer + globals.
 *
 * No loops. No switch. No goto.
 */
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
    } else if (a ==  b) {
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


/*
 * 73: complicated merged control flow.
 *
 * Multiple assignments converge into the final return.
 */
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


/*
 * 74: intentionally high-density IF case.
 *
 * This is the "stress" case for the IF-only corpus, not a replacement
 * for the smaller focused tests above.
 */
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
            if (a ==  (b + c / 10 * (a - 1)))
                return result + 100;
            else
                return result + 200;
        }
    }

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
     *
     * The same executable can therefore be run with many inputs.
     */
    int a = (argc > 1) ? atoi(argv[1]) : 4;
    int test = (argc > 2) ? atoi(argv[2]) : -1;

    int result = 0;

    /* -------------------------------------------------------------- */
    /* Minimal IFs                                                     */
    /* -------------------------------------------------------------- */

    result += _00_if_only(a);
    result += _01_if_else(a);
    result += _02_if_with_surrounding_code(a);
    result += _03_if_compound(a);
    result += _04_if_else_compound(a);
    if (test ==  0) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Simple conditions                                               */
    /* -------------------------------------------------------------- */

    result += _05_if_equal(a, 4);
    result += _06_if_not_equal(a, 4);
    result += _07_relational(a, 4);
    result += _08_boolean_argument(a > 0, a);
    if (test ==  1) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Else-if                                                         */
    /* -------------------------------------------------------------- */

    result += _09_if_elseif_else(a);
    result += _10_multiple_elseif(a);
    result += _11_elseif_expressions(a, 4);
    if (test ==  2) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Logical conditions                                              */
    /* -------------------------------------------------------------- */

    result += _12_and(a, 3);
    result += _13_or(a, -3);
    result += _14_and_or(a, 2, -1);
    result += _15_or_and(a, 0, 20);
    result += _16_complex_boolean(a, 3, 5, 1);
    if (test ==  3) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Arithmetic-heavy conditions                                     */
    /* -------------------------------------------------------------- */

    result += _17_nested_arithmetic_condition(a, 1, 20);
    result += _18_deep_parentheses(a, 2, 3);
    result += _19_arithmetic_boolean(a, 2, 5);
    result += _20_nested_boolean_parentheses(a, 3, 5, 7);
    if (test ==  4) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Nested IFs                                                      */
    /* -------------------------------------------------------------- */

    result += _21_nested_if(a, 3);
    result += _22_nested_in_else(a, 3);
    result += _23_nested_if_else(a, 3, 5);
    result += _24_three_level_nesting(a, 3, 5);
    result += _25_deep_nested_values(a, 3, 10);

    result += _26_nested_and(a, 3, 5);
    result += _27_nested_or(a, 0, 20);
    result += _28_nested_complex_boolean(a, 3, 5, 7);
    if (test ==  5) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Independent IFs                                                 */
    /* -------------------------------------------------------------- */

    result += _29_independent_ifs(a);
    result += _30_independent_if_else(a, 3);
    if (test ==  6) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Arrays                                                           */
    /* -------------------------------------------------------------- */

    result += _31_array_condition(1);
    result += _32_array_branches(2);
    result += _33_array_complex_condition(1, 2);
    result += _34_matrix_condition(1, 1);
    result += _35_nested_array(1, 2);
    if (test ==  7) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Pointers                                                         */
    /* -------------------------------------------------------------- */

    int pointer_value = a;

    result += _36_pointer_condition(&pointer_value);
    result += _37_pointer_branches(&pointer_value);
    result += _38_pointer_array(g_arr, 1);
    result += _39_nested_pointer(&pointer_value, 3);

    pointer_value = a;
    result += _40_pointer_write(&pointer_value, a);

    pointer_value = a;
    result += _41_pointer_write_nested(&pointer_value, a, 3);
    if (test ==  8) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Global-only functions                                            */
    /* -------------------------------------------------------------- */

    g_x = a;
    g_y = -3;
    g_z = 7;

    result += _42_global_only();
    result += _43_global_and();
    result += _44_global_or();
    result += _45_global_nested();
    result += _46_global_array_only();
    result += _47_global_matrix_only();
    if (test ==  9) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Multiple returns                                                 */
    /* -------------------------------------------------------------- */

    result += _48_multiple_returns(a);
    result += _49_nested_multiple_returns(a, 3);
    result += _50_complex_multiple_returns(a, 3, 5);
    if (test ==  10) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Prefix / suffix                                                  */
    /* -------------------------------------------------------------- */

    result += _51_prefix_code(a, 2, 3);
    result += _52_suffix_code(a, 3);
    result += _53_prefix_nested_suffix(a, 3, 5);
    if (test ==  11) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Merged paths / PHIs                                              */
    /* -------------------------------------------------------------- */

    result += _54_diamond(a, 3);
    result += _55_multiple_merge_values(a, 3);
    result += _56_nested_diamonds(a, 3, 5);
    if (test ==  12) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Ternary + IF                                                     */
    /* -------------------------------------------------------------- */

    result += _57_ternary_before_if(a, 3);
    result += _58_ternary_inside_if(a, 3);
    result += _59_nested_ternary_if(a, 3, 5);
    if (test ==  13) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Dynamic alloca / VLA                                             */
    /* -------------------------------------------------------------- */

    /*
     * Positive runtime sizes are used here deliberately.
     */
    result += _60_dynamic_alloca(4, a);
    result += _61_dynamic_alloca_pointer(5, a);
    result += _62_dynamic_alloca_complex(6, a, 3);
    if (test ==  14) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* malloc                                                           */
    /* -------------------------------------------------------------- */

    result += _63_malloc_if(4, a);
    result += _64_malloc_nested_if(4, a, 3);
    if (test ==  15) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /* -------------------------------------------------------------- */
    /* Void functions                                                   */
    /* -------------------------------------------------------------- */

    g_void_result = 0;

    _65_void_if(a);
    _66_void_if_else(a);
    _67_void_nested(a, 3);
    _68_void_complex(a, 3, 0);
    _69_void_global_only();

    pointer_value = a;
    _70_void_pointer(&pointer_value, a);

    _71_void_array(1, a);
    if (test ==  16) { printf("%d\n", result); return 0; }  /* stop after section 0 */
    /*
     * Make void-function behavior part of the observable output.
     */
    result += g_void_result;

    /* -------------------------------------------------------------- */
    /* Complex cases                                                    */
    /* -------------------------------------------------------------- */

    pointer_value = a;

    result += _72_complex_control_flow(
        &pointer_value, 1, a, 3
    );

    result += _73_complex_merge(a, 3, 5);

    result += _74_if_stress(
        &pointer_value, 1, a, 3, 5
    );

    /* -------------------------------------------------------------- */
    /* Differential-testing output                                     */
    /* -------------------------------------------------------------- */

    printf("%d\n", result);

    return 0;
}

