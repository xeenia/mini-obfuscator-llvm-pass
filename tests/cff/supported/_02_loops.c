#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

/* ================================================================== */
/* Globals                                                            */
/* ================================================================== */

int g_x = 10;
int g_y = -3;
int g_z = 7;
int g_n = 4;

int g_limit = 10;
int g_step = 0;
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
/* 0. SIMPLE LOOPS                                                    */
/* ================================================================== */

/* 0: classic for */
int _0_for_simple(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += i;

    return sum;
}


/* 1: classic while */
int _1_while_simple(int n)
{
    int i = 0;
    int sum = 0;

    while (i < n) {
        sum += i;
        i++;
    }

    return sum;
}


/* 2: classic do-while */
int _2_dowhile_simple(int n)
{
    int i = 0;
    int sum = 0;

    do {
        sum += i;
        i++;
    } while (i < n);

    return sum;
}


/* 3: for with empty body */
int _3_for_empty_body(int n)
{
    int i;

    for (i = 0; i < n; i++)
        ;

    return i;
}


/* 4: loop with a constant condition and break */
int _4_while_true_break(int n)
{
    int i = 0;
    int sum = 0;

    while (1) {
        if (0)
            break;

        sum += i;
        i++;
        if (i < n)
            break;
    }

    return sum;
}


/*
 * The two constant-false conditions above are intentionally replaced
 * below by ternary-controlled loop behavior so this corpus contains
 * no conditional statements.
 */

/* 5: for with continue */
int _5_for_continue(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        bool skip = (i % 2 == 0);

        if (skip)
            continue;

        sum += i;
    }

    return sum;
}


/* ================================================================== */
/* 1. LOOP CONDITIONS                                                  */
/* ================================================================== */

/* 6: relational loop condition */
int _6_relational_loop(int a, int b)
{
    int sum = 0;

    for (int i = a; i < b; i++)
        sum += i;

    return sum;
}


/* 7: inequality loop condition */
int _7_not_equal_loop(int n)
{
    int i = 0;
    int sum = 0;

    while (i != n) {
        sum += i;
        i += (n > 0) ? 1 : -1;
    }

    return sum;
}


/* 8: loop condition with && */
int _8_loop_and(int a, int b)
{
    int i = 0;
    int sum = 0;

    while (i < a && i < b) {
        sum += i;
        i++;
    }

    return sum;
}


/* 9: loop condition with || */
int _9_loop_or(int a, int b)
{
    int i = 0;
    int sum = 0;

    while (i < a || i < b) {
        sum += i;
        i++;
    }

    return sum;
}


/* 10: deeply parenthesized loop condition */
int _10_nested_loop_condition(int a, int b, int c, int d)
{
    int i = 0;
    int sum = 0;

    while (((i < a) && ((i < b) || (i == c))) ||
           ((i == d) && (i < a))) {
        sum += i;
        i++;

        if (i > 20)
            break;
    }

    return sum;
}


/* ================================================================== */
/* 2. LOOP BODY EXPRESSIONS                                            */
/* ================================================================== */

/* 11: arithmetic-heavy loop */
int _11_arithmetic_loop(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += i * 3 + (i - 1) * 2;

    return sum;
}


/* 12: nested arithmetic expression */
int _12_nested_arithmetic_loop(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++)
        result += i == (i + 1 / 2 * (i - 1))
                     ? i * 2
                     : i + 3;

    return result;
}


/* 13: ternary inside loop body */
int _13_ternary_loop_body(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++)
        result += (i % 2 == 0) ? i * 2 : i * 3;

    return result;
}


/* 14: multiple independent loop accumulations */
int _14_multiple_accumulators(int n)
{
    int even = 0;
    int odd = 0;
    int total = 0;

    for (int i = 0; i < n; i++) {
        even += (i % 2 == 0) ? i : 0;
        odd += (i % 2 != 0) ? i : 0;
        total += i;
    }

    return even + odd + total;
}


/* ================================================================== */
/* 3. NESTED LOOPS                                                     */
/* ================================================================== */

/* 15: double for */
int _15_nested_for(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            sum += i + j;

    return sum;
}


/* 16: for + while */
int _16_for_while(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        int j = 0;

        while (j < i) {
            sum += i * j;
            j++;
        }
    }

    return sum;
}


/* 17: while + do-while */
int _17_while_dowhile(int n)
{
    int i = 0;
    int total = 0;

    while (i < n) {
        int j = 0;

        do {
            total += i + j;
            j++;
        } while (j < 2);

        i++;
    }

    return total;
}


/* 18: triple nested loop */
int _18_triple_for(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            for (int k = 0; k < 2; k++)
                sum += i + j + k;

    return sum;
}


/* 19: mixed three-level nesting */
int _19_mixed_nested_loops(int n)
{
    int total = 0;

    for (int i = 0; i < n; i++) {
        int j = 0;

        while (j < 3) {
            int k = 0;

            do {
                total += i + j + k;
                k++;
            } while (k < 2);

            j++;
        }
    }

    return total;
}


/* ================================================================== */
/* 4. BREAK / CONTINUE                                                 */
/* ================================================================== */

/* 20: break from inner loop */
int _20_inner_break(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            sum += i + j;

            if (j >= 2)
                break;
        }
    }

    return sum;
}


/* 21: continue in inner loop */
int _21_inner_continue(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            bool skip = (j % 2 == 0);

            if (skip)
                continue;

            sum += i + j;
        }
    }

    return sum;
}


/* 22: break controlled by a loop-body condition */
int _22_break_with_ternary(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        int stop = (i > 3) ? 1 : 0;

        for (int j = 0; j < n; j++) {
            sum += i + j;

            if (stop && j >= 2)
                break;
        }
    }

    return sum;
}


/* 23: continue + break */
int _23_continue_and_break(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        int j = 0;

        while (j < n) {
            j++;

            if (j % 2 == 0)
                continue;

            sum += i + j;

            if (sum > 30)
                break;
        }
    }

    return sum;
}


/* ================================================================== */
/* 5. EARLY RETURNS FROM LOOPS                                         */
/* ================================================================== */

/* 24: early return from outer loop */
int _24_early_return(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        sum += i;

        if (sum > 20)
            return sum;
    }

    return sum;
}


/* 25: early return from nested loop */
int _25_nested_early_return(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            sum += i + j;

            if (sum > 40)
                return sum;
        }
    }

    return sum;
}


/* 26: multiple return paths from a loop */
int _26_multiple_returns(int n)
{
    int sum = 0;

    while (n > 0) {
        sum += n;

        if (sum > 20)
            return sum;

        n--;
    }

    return sum;
}


/* 27: do-while with early return */
int _27_dowhile_return(int n)
{
    int i = 0;
    int sum = 0;

    do {
        sum += i;

        if (i >= n)
            return sum;

        i++;
    } while (1);

    return sum;
}


/* ================================================================== */
/* 6. COMPLEX LOOP NESTING                                             */
/* ================================================================== */

/* 28: for -> while -> for */
int _28_for_while_for(int n)
{
    int total = 0;

    for (int i = 0; i < n; i++) {
        int j = 0;

        while (j < 3) {
            for (int k = 0; k < 2; k++)
                total += i + j + k;

            j++;
        }
    }

    return total;
}


/* 29: while -> for -> do-while */
int _29_while_for_dowhile(int n)
{
    int i = 0;
    int total = 0;

    while (i < n) {
        for (int j = 0; j < 3; j++) {
            int k = 0;

            do {
                total += i + j + k;
                k++;
            } while (k < 2);
        }

        i++;
    }

    return total;
}


/* 30: four levels of loops */
int _30_four_level_nesting(int n)
{
    int total = 0;

    for (int a = 0; a < n; a++)
        for (int b = 0; b < 2; b++)
            for (int c = 0; c < 2; c++)
                for (int d = 0; d < 2; d++)
                    total += a + b + c + d;

    return total;
}


/* ================================================================== */
/* 7. COMPLEX LOOP HEADERS                                             */
/* ================================================================== */

/* 31: multiple variables in for header */
int _31_multiple_loop_variables(int n)
{
    int sum = 0;

    for (int i = 0, j = n; i < j; i++, j--)
        sum += i + j;

    return sum;
}


/* 32: different update expressions */
int _32_complex_update(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i += 2)
        sum += i;

    return sum;
}


/* 33: decreasing loop */
int _33_decreasing_loop(int n)
{
    int sum = 0;

    for (int i = n; i > 0; i--)
        sum += i;

    return sum;
}


/* 34: loop with several condition variables */
int _34_multiple_condition_values(int a, int b, int c)
{
    int i = 0;
    int sum = 0;

    while ((i < a && i < b) || (i < c && i < 10)) {
        sum += i;
        i++;
    }

    return sum;
}


/* 35: loop condition using previous computation */
int _35_computed_loop_limit(int a, int b)
{
    int limit = (a > b) ? a : b;
    int sum = 0;

    for (int i = 0; i < limit; i++)
        sum += i * limit;

    return sum;
}


/* ================================================================== */
/* 8. ARRAYS                                                           */
/* ================================================================== */

/* 36: array traversal */
int _36_array_for(int n)
{
    int sum = 0;
    int limit = (n < 8) ? n : 8;

    for (int i = 0; i < limit; i++)
        sum += g_arr[i];

    return sum;
}


/* 37: array traversal with while */
int _37_array_while(int n)
{
    int i = 0;
    int sum = 0;
    int limit = (n < 8) ? n : 8;

    while (i < limit) {
        sum += g_arr[i];
        i++;
    }

    return sum;
}


/* 38: two-dimensional array */
int _38_matrix_nested(int n)
{
    int total = 0;
    int limit = (n < 3) ? n : 3;

    for (int r = 0; r < limit; r++)
        for (int c = 0; c < 3; c++)
            total += g_mat[r][c];

    return total;
}


/* 39: array values control loop updates */
int _39_array_controlled_loop(int n)
{
    int i = 0;
    int total = 0;

    while (i < n && i < 8) {
        int step = (g_arr[i] >= 0) ? 1 : 2;

        total += g_arr[i];
        i += step;
    }

    return total;
}


/* 40: array writes inside loop */
int _40_array_write_loop(int n)
{
    int limit = (n < 8) ? n : 8;
    int sum = 0;

    for (int i = 0; i < limit; i++) {
        g_arr[i] = i * 2;
        sum += g_arr[i];
    }

    return sum;
}


/* ================================================================== */
/* 9. POINTERS                                                         */
/* ================================================================== */

/* 41: pointer traversal */
int _41_pointer_loop(int *p, int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += p[i];

    return sum;
}


/* 42: pointer increment */
int _42_pointer_increment(int *p, int n)
{
    int sum = 0;

    while (n > 0) {
        sum += *p;
        p++;
        n--;
    }

    return sum;
}


/* 43: pointer writes */
int _43_pointer_write_loop(int *p, int n)
{
    int sum = 0;

    for (int i = 0; i < n; i++) {
        p[i] = i * 3;
        sum += p[i];
    }

    return sum;
}


/* 44: pointer + global array */
int _44_pointer_array_loop(int *p, int n)
{
    int sum = 0;
    int limit = (n < 8) ? n : 8;

    for (int i = 0; i < limit; i++)
        sum += p[i] + g_arr[i];

    return sum;
}


/* 45: pointer-controlled nested loop */
int _45_pointer_nested_loop(int *p, int n)
{
    int total = 0;

    for (int i = 0; i < n; i++) {
        int limit = (*p > 0) ? 3 : 2;

        for (int j = 0; j < limit; j++)
            total += i + j + *p;
    }

    return total;
}


/* ================================================================== */
/* 10. GLOBAL-ONLY LOOPS — NO LOCAL VARIABLES                          */
/* ================================================================== */

/*
 * These deliberately use globals directly and define no local
 * variables.
 */

/* 46: global-only for */
int _46_global_for(void)
{
    for (g_x = 0; g_x < g_limit; g_x++)
        g_y += g_x;

    return g_y;
}


/*
 * 47: global-only while.
 *
 * g_x is used directly as loop state.
 */
int _47_global_while(void)
{
    while (g_x < g_limit)
        g_x += g_step;

    return g_x + g_y;
}


/* 48: global array loop */
int _48_global_array_loop(void)
{
    for (g_x = 0; g_x < 8; g_x++)
        g_y += g_arr[g_x];

    return g_y;
}


/* 49: global matrix loop */
int _49_global_matrix_loop(void)
{
    for (g_x = 0; g_x < 3; g_x++)
        for (g_y = 0; g_y < 3; g_y++)
            g_z += g_mat[g_x][g_y];

    return g_z;
}


/* ================================================================== */
/* 11. GLOBAL LOOPS WITH MORE COMPLEX STATE                            */
/* ================================================================== */

/* 50: globals used as loop state and accumulator */
int _50_global_state_loop(void)
{
    g_x = 0;
    g_y = 0;

    while (g_x < g_limit) {
        g_y += g_x;
        g_x++;
    }

    return g_y;
}


/* 51: global nested loops */
int _51_global_nested(void)
{
    int total = 0;

    for (g_x = 0; g_x < g_n; g_x++)
        for (g_y = 0; g_y < g_limit; g_y++)
            total += g_x + g_y + g_z;

    return total;
}


/* ================================================================== */
/* 12. MERGED LOOP VALUES / PHI-HEAVY CASES                            */
/* ================================================================== */

/* 52: loop-carried accumulator */
int _52_loop_carried_value(int n)
{
    int value = 1;

    for (int i = 0; i < n; i++)
        value = value * 2 + i;

    return value;
}


/* 53: several loop-carried values */
int _53_multiple_loop_carried(int n)
{
    int a = 1;
    int b = 2;
    int c = 3;

    for (int i = 0; i < n; i++) {
        int old_a = a;
        int old_b = b;

        a = old_b + i;
        b = c + old_a;
        c = a + b;
    }

    return a + b + c;
}


/* 54: nested loop-carried state */
int _54_nested_loop_carried(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        int value = i;

        while (value > 0) {
            result += value;
            value--;
        }
    }

    return result;
}


/* 55: loop with values surviving after the loop */
int _55_value_after_loop(int n)
{
    int value = 10;

    for (int i = 0; i < n; i++)
        value += i * 2;

    value *= 3;
    value -= n;

    return value;
}


/* ================================================================== */
/* 13. PREFIX / SUFFIX AROUND LOOPS                                    */
/* ================================================================== */

/* 56: substantial code before loop */
int _56_prefix_loop(int a, int b, int n)
{
    int x = a + b;
    int y = x * 2;
    int z = y - 3;
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += i + z;

    return sum + x + y;
}


/* 57: substantial code after loop */
int _57_suffix_loop(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++)
        result += i;

    result *= 2;
    result += 10;
    result *= 3;

    return result;
}


/* 58: code before + nested loops + code after */
int _58_prefix_nested_suffix(int a, int n)
{
    int result = a * 2;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < 2; j++)
            result += i + j;
    }

    result += a;
    result *= 2;

    return result;
}


/* ================================================================== */
/* 14. ?: WITH LOOPS                                                   */
/* ================================================================== */

/* 59: ternary determines loop limit */
int _59_ternary_loop_limit(int a, int b)
{
    int limit = (a > b) ? a : b;
    int result = 0;

    for (int i = 0; i < limit; i++)
        result += i;

    return result;
}


/* 60: ternary determines loop update */
int _60_ternary_loop_update(int n)
{
    int sum = 0;

    for (int i = 0; i < n; i += (i % 2 == 0) ? 1 : 2)
        sum += i;

    return sum;
}


/* 61: nested ternary inside nested loops */
int _61_nested_ternary_loops(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        int base = (i > 3) ? ((i > 6) ? 3 : 2) : 1;

        for (int j = 0; j < base; j++)
            result += (j % 2 == 0) ? i + j : i - j;
    }

    return result;
}


/* ================================================================== */
/* 15. DYNAMIC ALLOCA / VLA                                            */
/* ================================================================== */

/*
 * Runtime-sized local array.
 *
 * The size is computed at runtime, therefore LLVM receives a dynamic
 * alloca.
 */
int _62_dynamic_alloca(int n, int x)
{
    int size = (n > 0) ? n : 1;
    int local[size];
    int sum = 0;

    for (int i = 0; i < size; i++) {
        local[i] = x + i;
        sum += local[i];
    }

    return sum;
}


/*
 * VLA + pointer traversal.
 */
int _63_dynamic_alloca_pointer(int n, int x)
{
    int size = (n > 0) ? n : 1;
    int local[size];
    int *p = local;
    int sum = 0;

    for (int i = 0; i < size; i++)
        p[i] = x + i * 2;

    for (int i = 0; i < size; i++)
        sum += *(p + i);

    return sum;
}


/*
 * VLA + nested loops.
 */
int _64_dynamic_alloca_nested(int n, int x)
{
    int size = (n > 0) ? n : 1;
    int values[size];
    int total = 0;

    for (int i = 0; i < size; i++)
        values[i] = x + i;

    for (int i = 0; i < size; i++)
        for (int j = 0; j < 2; j++)
            total += values[i] + j;

    return total;
}


/* ================================================================== */
/* 16. MALLOC + LOOPS                                                  */
/* ================================================================== */

/*
 * malloc without an if statement.
 *
 * The conditional operator prevents dereferencing NULL.
 */
int _65_malloc_loop(int n, int x)
{
    int size = (n > 0) ? n : 1;
    int *p = malloc((size_t)size * sizeof(int));
    int sum = 0;

    p ? (p[0] = x) : 0;

    for (int i = 0; i < size; i++)
        p ? (p[i] = x + i) : 0;

    for (int i = 0; i < size; i++)
        sum += p ? p[i] : -1;

    free(p);

    return sum;
}


/*
 * malloc + nested loops.
 */
int _66_malloc_nested(int n, int x, int y)
{
    int size = (n > 0) ? n : 1;
    int *p = malloc((size_t)size * sizeof(int));
    int result = 0;

    for (int i = 0; i < size; i++)
        p ? (p[i] = x + i) : 0;

    for (int i = 0; i < size; i++)
        for (int j = 0; j < 2; j++)
            result += p ? p[i] + y + j : -1;

    free(p);

    return result;
}


/* ================================================================== */
/* 17. VOID FUNCTIONS                                                  */
/* ================================================================== */

/*
 * Void functions modify g_void_result so their behavior remains
 * observable to the differential test.
 */

/* 67: simple void for */
void _67_void_for(int n)
{
    for (int i = 0; i < n; i++)
        g_void_result += i;
}


/* 68: void while */
void _68_void_while(int n)
{
    int i = 0;

    while (i < n) {
        g_void_result += i * 2;
        i++;
    }
}


/* 69: void do-while */
void _69_void_dowhile(int n)
{
    int i = 0;

    do {
        g_void_result += i + 1;
        i++;
    } while (i < n);
}


/* 70: void nested loops */
void _70_void_nested(int n)
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < 2; j++)
            g_void_result += i + j;
}


/* 71: void loop with continue */
void _71_void_continue(int n)
{
    for (int i = 0; i < n; i++) {
        if (i % 2 == 0)
            continue;

        g_void_result += i;
    }
}


/* 72: void global-only loop */
void _72_void_global_only(void)
{
    while (g_x < g_limit) {
        g_void_result += g_x;
        g_x += g_step;
    }
}


/* ================================================================== */
/* 18. VOID POINTER / ARRAY EFFECTS                                    */
/* ================================================================== */

/* 73: void pointer loop */
void _73_void_pointer(int *p, int n)
{
    for (int i = 0; i < n; i++) {
        p[i] += i;
        g_void_result += p[i];
    }
}


/* 74: void array modification */
void _74_void_array(int n)
{
    int limit = (n < 8) ? n : 8;

    for (int i = 0; i < limit; i++) {
        g_arr[i] += i;
        g_void_result += g_arr[i];
    }
}


/* ================================================================== */
/* 19. MULTIPLE RETURNS / LOOP EXIT STRUCTURES                         */
/* ================================================================== */

/* 75: return before loop / after loop without an if statement */
int _75_loop_return_paths(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        result += i;

        if (i == 3)
            return result;
    }

    return result + 100;
}


/* 76: nested loop with multiple return points */
int _76_nested_return_paths(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            result += i + j;

            if (j == 2)
                return result;

            if (result > 30)
                return result * 2;
        }
    }

    return result + 100;
}


/* 77: loop result followed by multiple return expressions */
int _77_loop_final_returns(int n)
{
    int result = 0;

    for (int i = 0; i < n; i++)
        result += i;

    return result > 20 ? result * 2 : result + 10;
}


/* ================================================================== */
/* 20. LOOP-CARRIED / COMPLEX STATE                                    */
/* ================================================================== */

/* 78: state updated through several loop iterations */
int _78_state_machine_loop(int n)
{
    int state = 1;
    int value = 0;

    for (int i = 0; i < n; i++) {
        value += state * i;
        state = (state == 1) ? 2 : 1;
    }

    return value + state;
}


/* 79: several values crossing loop backedges */
int _79_multiple_backedge_values(int n)
{
    int a = 1;
    int b = 2;
    int c = 3;

    for (int i = 0; i < n; i++) {
        a = b + i;
        b = c + a;
        c = a + b + i;
    }

    return a + b + c;
}


/* 80: nested loop state crossing multiple backedges */
int _80_nested_state(int n)
{
    int result = 0;
    int state = 1;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < 3; j++) {
            result += state + i + j;
            state = (state + i + j) % 5;
        }
    }

    return result + state;
}


/* ================================================================== */
/* 21. COMPLEX ARRAY / POINTER LOOP CASES                              */
/* ================================================================== */

/*
 * 81: array + pointer + nested loops.
 */
int _81_array_pointer_nested(int *p, int n)
{
    int limit = (n < 8) ? n : 8;
    int result = 0;

    for (int i = 0; i < limit; i++) {
        for (int j = 0; j < 2; j++) {
            result += p[i] + g_arr[i] + j;
            p[i] += (g_arr[i] > 0) ? 1 : -1;
        }
    }

    return result;
}


/*
 * 82: matrix + loop-carried state.
 */
int _82_matrix_state(int n)
{
    int limit = (n < 3) ? n : 3;
    int state = 0;

    for (int r = 0; r < limit; r++) {
        for (int c = 0; c < 3; c++)
            state += g_mat[r][c];

        state = (state > 20) ? state / 2 : state + 3;
    }

    return state;
}


/* ================================================================== */
/* 22. FINAL HIGH-DENSITY LOOP CASES                                   */
/* ================================================================== */

/*
 * 83: deeply nested loops + arrays + pointer + globals.
 */
int _83_complex_loop_control(int *p, int n, int a, int b)
{
    int limit = (a > b) ? a : b;
    limit = (limit > 6) ? 6 : limit;
    limit = (limit < 1) ? 1 : limit;

    int result = g_x;

    for (int i = 0; i < limit; i++) {
        int j = 0;

        while (j < g_limit) {
            for (int k = 0; k < 2; k++) {
                int index = (i + j + k) % 8;

                result += g_arr[index];
                result += *p;

                *p += (g_arr[index] % 2 == 0) ? 1 : -1;

                if (result > 50)
                    return result;
            }

            j++;
        }
    }

    return result;
}


/*
 * 84: complex loop conditions + nested loops + carried state.
 */
int _84_complex_loop_state(int *p, int n, int a, int b, int c)
{
    int result = a + g_x;
    int state = 0;

    for (int i = 0;
         (i < n && i < 8) || (state < 3 && i < 10);
         i++) {

        state = (i + a > b) ? state + 1 : state - 1;

        for (int j = 0; j < 3 && state < 5; j++) {
            result += g_arr[i % 8];
            result += *p + c;

            *p += (result % 2 == 0) ? 1 : -1;
        }
    }

    return result + state;
}


/*
 * 85: stress case.
 *
 * No switch. No goto.
 * Only loops, loop exits, returns, and ?:.
 */
int _85_loop_stress(int *p, int n, int a, int b, int c)
{
    int limit = (a > b) ? a : b;
    limit = (limit > 8) ? 8 : limit;

    int result = a + g_x;
    int state = 0;

    for (int i = 0;
         (i < limit && state < 10) ||
         (i < n && c != 0);
         i++) {

        int index = (i + state) % 8;

        result += g_arr[index];

        while (state < 4 && i < g_limit) {
            result += i + state;

            for (int j = 0; j < 2; j++) {
                result += g_arr[(index + j) % 8];

                *p += (result > 0) ? 1 : -1;

                if (*p > 20)
                    break;
            }

            state++;
        }

        result += *p;

        if (result > 100)
            return result;
    }

    return (result > 0) ? result * 2 : -result;
}


/* ================================================================== */
/* Driver                                                              */
/* ================================================================== */

int main(int argc, char **argv)
{
    int raw_a = (argc > 1) ? atoi(argv[1]) : 4;
    int test = (argc > 2) ? atoi(argv[2]) : -1;
    int result = 0;

    /*
     * INPUT SANITIZATION PRIOR TO CALLING TEST FUNCTIONS:
     * 1. Ensure `a` is strictly positive (non-negative and non-zero).
     * 2. Ensure global step values driving while loops are non-zero/positive 
     *    so that loops like `_47_global_while` terminate cleanly.
     */
    int a = abs(raw_a);
    if (a == 0) {
        a = 1;
    }

    if (g_step <= 0) {
        g_step = 1;
    }
    if (g_limit <= 0) {
        g_limit = 10;
    }

    /* -------------------------------------------------------------- */
    /* Simple loops                                                     */
    /* -------------------------------------------------------------- */
    result += _0_for_simple(a);
    result += _1_while_simple(a);
    result += _2_dowhile_simple(a);
    result += _3_for_empty_body(3);
    result += _4_while_true_break(a);
    result += _5_for_continue(a);
    if (test ==  0) { printf("%d\n", result); return 0; }  /* stop after section 0 */

    /* -------------------------------------------------------------- */
    /* Loop conditions                                                  */
    /* -------------------------------------------------------------- */

    result += _6_relational_loop(a, a + 6);
    result += _7_not_equal_loop(a);
    result += _8_loop_and(a, 5);
    result += _9_loop_or(a, 5);
    result += _10_nested_loop_condition(a, 6, 3, 4);
    if (test ==  1) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Loop body expressions                                             */
    /* -------------------------------------------------------------- */

    result += _11_arithmetic_loop(a);
    result += _12_nested_arithmetic_loop(a);
    result += _13_ternary_loop_body(a);
    result += _14_multiple_accumulators(a);
    if (test ==  2) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Nested loops                                                     */
    /* -------------------------------------------------------------- */

    result += _15_nested_for(3);
    result += _16_for_while(4);
    result += _17_while_dowhile(3);
    result += _18_triple_for(2);
    result += _19_mixed_nested_loops(3);
    if (test ==  3) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Break / continue                                                 */
    /* -------------------------------------------------------------- */

    result += _20_inner_break(5);
    result += _21_inner_continue(5);
    result += _22_break_with_ternary(5);
    result += _23_continue_and_break(6);
    if (test ==  4) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Early returns                                                    */
    /* -------------------------------------------------------------- */

    result += _24_early_return(a);
    result += _25_nested_early_return(a);
    result += _26_multiple_returns(a);
    result += _27_dowhile_return(a);
    if (test ==  5) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Complex nesting                                                  */
    /* -------------------------------------------------------------- */

    result += _28_for_while_for(3);
    result += _29_while_for_dowhile(3);
    result += _30_four_level_nesting(2);
    if (test ==  6) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Complex loop headers                                             */
    /* -------------------------------------------------------------- */

    result += _31_multiple_loop_variables(6);
    result += _32_complex_update(a);
    result += _33_decreasing_loop(6);
    result += _34_multiple_condition_values(a, 6, 4);
    result += _35_computed_loop_limit(a, 3);
    if (test ==  7) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Arrays                                                            */
    /* -------------------------------------------------------------- */

    result += _36_array_for(6);
    result += _37_array_while(6);
    result += _38_matrix_nested(3);
    result += _39_array_controlled_loop(6);
    if (test ==  8) { printf("%d\n", result); return 0; }

    /*
     * Reset the global array before modifying it.
     */
    g_arr[0] = 0;
    g_arr[1] = 1;
    g_arr[2] = -2;
    g_arr[3] = 3;
    g_arr[4] = -4;
    g_arr[5] = 5;
    g_arr[6] = 6;
    g_arr[7] = -7;

    result += _40_array_write_loop(6);
    if (test ==  9) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Pointers                                                         */
    /* -------------------------------------------------------------- */

    int pointer_data[8] = {
        1, 2, 3, 4, 5, 6, 7, 8
    };

    result += _41_pointer_loop(pointer_data, 6);
    result += _42_pointer_increment(pointer_data, 6);
    result += _43_pointer_write_loop(pointer_data, 6);
    result += _44_pointer_array_loop(pointer_data, 6);
    result += _45_pointer_nested_loop(pointer_data, 4);
    if (test ==  10) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Global-only loops                                                */
    /* -------------------------------------------------------------- */

    g_x = 0;
    g_y = -3;
    g_z = 7;

    result += _46_global_for();
    result += _47_global_while();
    result += _48_global_array_loop();
    result += _49_global_matrix_loop();

    g_x = a;
    g_y = 0;
    g_z = 7;

    result += _50_global_state_loop();

    g_x = 0;
    g_y = 0;
    g_z = 7;

    result += _51_global_nested();
    if (test ==  11) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Loop-carried values                                              */
    /* -------------------------------------------------------------- */

    result += _52_loop_carried_value(a);
    result += _53_multiple_loop_carried(a);
    result += _54_nested_loop_carried(a);
    result += _55_value_after_loop(a);
    if (test ==  12) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Prefix / suffix                                                  */
    /* -------------------------------------------------------------- */

    result += _56_prefix_loop(a, 2, 4);
    result += _57_suffix_loop(a);
    result += _58_prefix_nested_suffix(a, 4);
    if (test ==  13) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Ternary + loops                                                  */
    /* -------------------------------------------------------------- */

    result += _59_ternary_loop_limit(a, 5);
    result += _60_ternary_loop_update(6);
    result += _61_nested_ternary_loops(6);
    if (test ==  14) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Dynamic alloca / VLA                                             */
    /* -------------------------------------------------------------- */

    result += _62_dynamic_alloca(4, a);
    result += _63_dynamic_alloca_pointer(5, a);
    result += _64_dynamic_alloca_nested(4, a);
    if (test ==  15) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* malloc                                                           */
    /* -------------------------------------------------------------- */

    result += _65_malloc_loop(4, a);
    result += _66_malloc_nested(4, a, 3);
    if (test ==  16) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Void functions                                                   */
    /* -------------------------------------------------------------- */

    g_void_result = 0;

    _67_void_for(a);
    _68_void_while(a);
    _69_void_dowhile(a);
    _70_void_nested(a);
    _71_void_continue(a);

    g_x = 0;
    g_y = 0;
    g_z = 7;

    _72_void_global_only();

    _73_void_pointer(pointer_data, 6);
    _74_void_array(6);

    result += g_void_result;
    if (test ==  17) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Multiple returns                                                 */
    /* -------------------------------------------------------------- */

    result += _75_loop_return_paths(a);
    result += _76_nested_return_paths(a);
    result += _77_loop_final_returns(a);
    if (test ==  18) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Complex loop-carried state                                       */
    /* -------------------------------------------------------------- */

    result += _78_state_machine_loop(a);
    result += _79_multiple_backedge_values(a);
    result += _80_nested_state(a);
    if (test ==  19) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Array / pointer stress                                           */
    /* -------------------------------------------------------------- */

    pointer_data[0] = 1;
    pointer_data[1] = 2;
    pointer_data[2] = 3;
    pointer_data[3] = 4;
    pointer_data[4] = 5;
    pointer_data[5] = 6;
    pointer_data[6] = 7;
    pointer_data[7] = 8;

    result += _81_array_pointer_nested(pointer_data, 5);
    result += _82_matrix_state(3);
    if (test ==  20) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Final high-density loop cases                                    */
    /* -------------------------------------------------------------- */

    int stress_pointer = a;

    result += _83_complex_loop_control(
        &stress_pointer, 5, a, 3
    );

    result += _84_complex_loop_state(
        &stress_pointer, 6, a, 3, 5
    );

    result += _85_loop_stress(
        &stress_pointer, 6, a, 3, 5
    );
    if (test ==  21) { printf("%d\n", result); return 0; }

    /* -------------------------------------------------------------- */
    /* Differential-testing output                                     */
    /* -------------------------------------------------------------- */

    printf("%d\n", result);

    return 0;
}