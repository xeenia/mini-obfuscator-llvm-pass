#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int g_void_result = 0;
int g_x = 10;
int g_y = -3;


/* ================================================================== */
/* 2. COMPUTED GOTO (indirectbr + blockaddress)                       */
/* ================================================================== */

/* 3: computed goto - indirectbr */
int _3_computed_goto(int x)
{
    static void *labels[] = {&&case0, &&case1, &&case2, &&case3};

    int result = 0;
    int idx = (x >= 0 && x < 4) ? x : 3;

    goto *labels[idx];

case0:
    result = 10;
    goto end;
case1:
    result = 20;
    goto end;
case2:
    result = 30;
    goto end;
case3:
    result = 40;
    goto end;

end:
    return result;
}

/* 4: computed goto with switch-like dispatch */
int _4_computed_goto_dispatch(int x, int y)
{
    static void *ops[] = {&&add, &&sub, &&mul, &&done};

    int result = 0;
    int op = (y >= 0 && y < 3) ? y : 3;

    goto *ops[op];

add:
    result = x + y;
    goto done;
sub:
    result = x - y;
    goto done;
mul:
    result = x * y;
    goto done;
done:
    return result;
}

/* ================================================================== */
/* 3. C++ EXCEPTION HANDLING                                          */
/* ================================================================== */

/* 5: try / catch */
int _5_try_catch(int x)
{
    int result = 0;

#ifdef __cplusplus
    try {
        if (x < 0)
            throw -1;
        result = x + 10;
    } catch (int e) {
        result = e;
    }
#else
    result = (x < 0) ? -1 : (x + 10);
#endif

    return result;
}

/* 6: nested try / catch */
int _6_nested_try_catch(int x, int y)
{
    int result = 0;

#ifdef __cplusplus
    try {
        try {
            if (x < 0)
                throw x;
            result = x * 2;
        } catch (int ex) {
            result = ex + 1;
            if (y > 0)
                throw y;
        }
    } catch (int ey) {
        result = ey * 3;
    }
#else
    if (x < 0) {
        result = x + 1;
        if (y > 0) {
            result = y * 3;
        }
    } else {
        result = x * 2;
    }
#endif

    return result;
}

/* ================================================================== */
/* 4. ASM GOTO (callbr)                                               */
/* ================================================================== */

/* 7: asm goto */
int _7_asm_goto(int x)
{
    int result = x;

#if defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
    __asm__ goto (
        "cmp $0, %0\n\t"
        "js %l[neg]\n\t"
        "jmp %l[nonneg]\n\t"
        :
        : "r"(x)
        :
        : neg, nonneg
    );

    result *= 2;
    goto done;

neg:
    result = -result;
    goto done;

nonneg:
    result += 100;

done:
#endif
    return result;
}

/* 8: asm goto with output */
int _8_asm_goto_output(int x, int *out)
{
    int result = x;
    int temp_out = 0;

#if defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
    __asm__ goto (
        "test %2, %2\n\t"
        "jz %l[zero]\n\t"
        "mov $1, %0\n\t"
        "jmp %l[done_lbl]\n\t"
        : "=r"(temp_out), "=r"(result)
        : "r"(x)
        :
        : zero, done_lbl
    );

zero:
    temp_out = 0;
    goto done_lbl;

done_lbl:
    *out = temp_out;
#else
    if (x == 0) {
        *out = 0;
    } else {
        *out = 1;
    }
#endif

    return result + *out;
}

/* ================================================================== */
/* Driver                                                             */
/* ================================================================== */

int main(int argc, char **argv)
{
    int a = (argc > 1) ? atoi(argv[1]) : 4;
    int b = (argc > 2) ? atoi(argv[2]) : 1;

    int result = 0;

    result += _0_switch_simple(a);
    result += _1_switch_in_if(a, b);
    result += _2_switch_fallthrough(a);

    result += _3_computed_goto(a);
    result += _4_computed_goto_dispatch(a, b);

    result += _5_try_catch(a);
    result += _6_nested_try_catch(a, b);

    int asm_out = 0;
    result += _7_asm_goto(a);
    result += _8_asm_goto_output(a, &asm_out);

    result += g_void_result;

    printf("%d\n", result);
    return 0;
}