#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>


/* ================================================================== */
/* 0. Simple switch                                                   */
/* ================================================================== */

int _00_switch_simple(int x)
{
    int result = 0;

    switch (x) {
        case 1:
            result = 10;
            break;

        case 2:
            result = 20;
            break;

        case 3:
            result = 30;
            break;
    }

    return result;
}


/* ================================================================== */
/* 1. Switch with default                                             */
/* ================================================================== */

int _01_switch_default(int x)
{
    int result = 100;

    switch (x) {
        case 1:
            result = 10;
            break;

        case 2:
            result = 20;
            break;

        case 3:
            result = 30;
            break;

        default:
            result = -1;
            break;
    }

    return result;
}


/* ================================================================== */
/* 2. Switch with negative values                                     */
/* ================================================================== */

int _02_switch_negative(int x)
{
    int result = 0;

    switch (x) {
        case -3:
            result = 300;
            break;

        case -2:
            result = 200;
            break;

        case -1:
            result = 100;
            break;

        case 0:
            result = 0;
            break;

        case 5:
            result = 500;
            break;

        default:
            result = -999;
            break;
    }

    return result;
}


/* ================================================================== */
/* 3. Fallthrough                                                     */
/* ================================================================== */

int _03_switch_fallthrough(int x)
{
    int result = 0;

    switch (x) {
        case 1:
        case 2:
            result += 10;
            break;

        case 3:
        case 4:
        case 5:
            result += 20;
            break;

        default:
            result = -1;
            break;
    }

    return result;
}


/* ================================================================== */
/* 4. Intentional fallthrough with multiple statements                */
/* ================================================================== */

int _04_switch_fallthrough_steps(int x)
{
    int result = 0;

    switch (x) {
        case 1:
            result += 1;

        case 2:
            result += 2;

        case 3:
            result += 4;
            break;

        default:
            result = -10;
            break;
    }

    return result;
}


/* ================================================================== */
/* 5. Code before and after switch                                    */
/* ================================================================== */

int _05_switch_before_after(int x)
{
    int result = 5;
    result *= 2;
    switch (x) {
        case 1:
            result += 10; break;
        case 2:
            result += 20; break;
        case 3:
            result += 30; break;
        default:
            result += 40; break;
    }
    result *= 3;
    result -= 7;
    return result;
}


/* ================================================================== */
/* 6. Multiple switches                                               */
/* ================================================================== */

int _06_switch_multiple(int x)
{
    int result = 0;

    switch (x) {
        case 1:
            result = 10;
            break;

        case 2:
            result = 20;
            break;

        default:
            result = 30;
            break;
    }

    switch (result) {
        case 10:
            result += 100;
            break;

        case 20:
            result += 200;
            break;

        default:
            result += 300;
            break;
    }

    return result;
}


/* ================================================================== */
/* 7. Two independent switches                                        */
/* ================================================================== */

int _07_switch_two_independent(int x)
{
    int a = 0;
    int b = 0;

    switch (x % 4) {
        case 0:
            a = 10;
            break;

        case 1:
            a = 20;
            break;

        case 2:
            a = 30;
            break;

        default:
            a = 40;
            break;
    }

    switch ((x + 1) % 3) {
        case 0:
            b = 100;
            break;

        case 1:
            b = 200;
            break;

        default:
            b = 300;
            break;
    }

    return a + b;
}


/* ================================================================== */
/* 8. Switch expression with arithmetic                               */
/* ================================================================== */

int _08_switch_expression(int x)
{
    int result = 0;
    int value = (x * 7 + 3) % 5;

    switch (value) {
        case 0:
            result = 100;
            break;

        case 1:
            result = 200;
            break;

        case 2:
            result = 300;
            break;

        case 3:
            result = 400;
            break;

        default:
            result = 500;
            break;
    }

    return result + x;
}


/* ================================================================== */
/* 9. Bitwise switch expression                                       */
/* ================================================================== */

int _09_switch_bitwise(int x)
{
    int result = 0;
    int key = (x ^ 0x55) & 7;

    switch (key) {
        case 0:
            result = 11;
            break;

        case 1:
            result = 22;
            break;

        case 2:
            result = 33;
            break;

        case 3:
            result = 44;
            break;

        case 4:
            result = 55;
            break;

        case 5:
            result = 66;
            break;

        case 6:
            result = 77;
            break;

        default:
            result = 88;
            break;
    }

    return result;
}


/* ================================================================== */
/* 10. Array access inside cases                                       */
/* ================================================================== */

int _10_switch_array(int x)
{
    int values[5] = {10, 20, 30, 40, 50};
    int result = 0;

    switch (x) {
        case 0:
            result = values[0];
            break;

        case 1:
            result = values[1];
            break;

        case 2:
            result = values[2];
            break;

        case 3:
            result = values[3];
            break;

        case 4:
            result = values[4];
            break;

        default:
            result = -1;
            break;
    }

    return result;
}


/* ================================================================== */
/* 11. Pointer access inside cases                                     */
/* ================================================================== */

int _11_switch_pointer(int x)
{
    int a = 10;
    int b = 20;
    int c = 30;

    int *ptr = &a;

    switch (x) {
        case 1:
            ptr = &a;
            break;

        case 2:
            ptr = &b;
            break;

        case 3:
            ptr = &c;
            break;

        default:
            ptr = &a;
            break;
    }

    return *ptr;
}


/* ================================================================== */
/* 12. Pointer modification inside cases                              */
/* ================================================================== */

int _12_switch_pointer_modify(int x)
{
    int values[3] = {10, 20, 30};
    int *ptr = values;

    switch (x) {
        case 1:
            ptr += 0;
            *ptr += 100;
            break;

        case 2:
            ptr += 1;
            *ptr += 200;
            break;

        case 3:
            ptr += 2;
            *ptr += 300;
            break;

        default:
            *ptr = -1;
            break;
    }

    return values[0] + values[1] + values[2];
}


/* ================================================================== */
/* 13. Nested switch                                                  */
/* ================================================================== */

int _13_switch_nested(int x)
{
    int result = 0;

    switch (x) {
        case 1:
            switch (x + 1) {
                case 2:
                    result = 12;
                    break;

                default:
                    result = 19;
                    break;
            }
            break;

        case 2:
            switch (x - 1) {
                case 1:
                    result = 21;
                    break;

                default:
                    result = 29;
                    break;
            }
            break;

        default:
            result = -1;
            break;
    }

    return result;
}


/* ================================================================== */
/* 14. Deeper nested switch                                           */
/* ================================================================== */

int _14_switch_deep_nested(int x)
{
    int result = 0;

    switch (x & 3) {
        case 0:
            switch (x & 7) {
                case 0:
                    switch (x & 15) {
                        case 0:
                            result = 100;
                            break;

                        default:
                            result = 101;
                            break;
                    }
                    break;

                default:
                    result = 102;
                    break;
            }
            break;

        case 1:
            switch (x & 7) {
                case 1:
                    switch (x & 15) {
                        case 1:
                            result = 200;
                            break;

                        default:
                            result = 201;
                            break;
                    }
                    break;

                default:
                    result = 202;
                    break;
            }
            break;

        default:
            result = 999;
            break;
    }

    return result;
}


/* ================================================================== */
/* 15. Nested switch with array                                       */
/* ================================================================== */

int _15_switch_nested_array(int x)
{
    int values[4] = {100, 200, 300, 400};
    int result = 0;

    switch (x & 1) {
        case 0:
            switch (x & 3) {
                case 0:
                    result = values[0];
                    break;

                case 2:
                    result = values[2];
                    break;

                default:
                    result = -10;
                    break;
            }
            break;

        case 1:
            switch (x & 3) {
                case 1:
                    result = values[1];
                    break;

                case 3:
                    result = values[3];
                    break;

                default:
                    result = -20;
                    break;
            }
            break;
    }

    return result;
}


/* ================================================================== */
/* 16. Nested switch with pointers                                    */
/* ================================================================== */

int _16_switch_nested_pointer(int x)
{
    int a = 10;
    int b = 20;
    int c = 30;
    int result = 0;

    int *ptr = &a;

    switch (x % 3) {
        case 0:
            switch (x & 1) {
                case 0:
                    ptr = &a;
                    break;

                case 1:
                    ptr = &b;
                    break;

                default:
                    ptr = &c;
                    break;
            }
            break;

        case 1:
            ptr = &b;
            break;

        default:
            ptr = &c;
            break;
    }

    result = *ptr + x;

    return result;
}


/* ================================================================== */
/* 17. Goto from switch cases                                         */
/* ================================================================== */

int _17_switch_goto(int x)
{
    int result = 0;

    switch (x) {
        case 1:
            goto CASE_ONE;

        case 2:
            goto CASE_TWO;

        case 3:
            goto CASE_THREE;

        default:
            goto CASE_DEFAULT;
    }

CASE_ONE:
    result = 100;
    goto DONE;

CASE_TWO:
    result = 200;
    goto DONE;

CASE_THREE:
    result = 300;
    goto DONE;

CASE_DEFAULT:
    result = -100;

DONE:
    return result;
}


/* ================================================================== */
/* 18. Multiple switches + goto                                       */
/* ================================================================== */

int _18_switch_multiple_goto(int x)
{
    int result = 0;

    switch (x & 3) {
        case 0:
            goto A;

        case 1:
            goto B;

        case 2:
            goto C;

        default:
            goto D;
    }

A:
    result += 10;
    goto SECOND;

B:
    result += 20;
    goto SECOND;

C:
    result += 30;
    goto SECOND;

D:
    result += 40;

SECOND:
    switch (result / 10) {
        case 1:
            result += 100;
            break;

        case 2:
            result += 200;
            break;

        case 3:
            result += 300;
            break;

        default:
            result += 400;
            break;
    }

    return result;
}


/* ================================================================== */
/* 19. Nested switch + goto                                           */
/* ================================================================== */

int _19_switch_nested_goto(int x)
{
    int result = 0;

    switch (x & 1) {
        case 0:
            switch (x & 3) {
                case 0:
                    goto ZERO;

                case 2:
                    goto TWO;

                default:
                    goto OTHER;
            }

        case 1:
            switch (x & 3) {
                case 1:
                    goto ONE;

                case 3:
                    goto THREE;

                default:
                    goto OTHER;
            }
    }

ZERO:
    result = 100;
    goto DONE;

ONE:
    result = 200;
    goto DONE;

TWO:
    result = 300;
    goto DONE;

THREE:
    result = 400;
    goto DONE;

OTHER:
    result = -1;

DONE:
    return result;
}


/* ================================================================== */
/* 20. Several values calculated before switch                         */
/* ================================================================== */

int _20_switch_precomputed(int x)
{
    int a = x * 3;
    int b = a ^ 0x55;
    int c = b + 17;
    int key = c & 7;
    int result = 0;

    switch (key) {
        case 0:
            result = a + b;
            break;

        case 1:
            result = b + c;
            break;

        case 2:
            result = a - c;
            break;

        case 3:
            result = a * 2;
            break;

        case 4:
            result = b * 2;
            break;

        case 5:
            result = c * 2;
            break;

        case 6:
            result = a ^ c;
            break;

        default:
            result = b ^ c;
            break;
    }

    return result;
}


/* ================================================================== */
/* 21. Array + nested switch + pointer                                */
/* ================================================================== */

int _21_switch_complex_data(int x)
{
    int values[8] = {
        11, 22, 33, 44,
        55, 66, 77, 88
    };

    int *ptr = values;
    int result = 0;
    int key = (x * 5 + 7) & 7;

    switch (key & 3) {
        case 0:
            switch (key) {
                case 0:
                    ptr = &values[0];
                    break;

                case 4:
                    ptr = &values[4];
                    break;

                default:
                    ptr = &values[1];
                    break;
            }
            break;

        case 1:
            switch (key) {
                case 1:
                    ptr = &values[1];
                    break;

                case 5:
                    ptr = &values[5];
                    break;

                default:
                    ptr = &values[2];
                    break;
            }
            break;

        case 2:
            switch (key) {
                case 2:
                    ptr = &values[2];
                    break;

                case 6:
                    ptr = &values[6];
                    break;

                default:
                    ptr = &values[3];
                    break;
            }
            break;

        default:
            switch (key) {
                case 3:
                    ptr = &values[3];
                    break;

                case 7:
                    ptr = &values[7];
                    break;

                default:
                    ptr = values;
                    break;
            }
            break;
    }

    result = *ptr;
    result += x;

    return result;
}


/* ================================================================== */
/* 22. Switch with several statements per case                        */
/* ================================================================== */

int _22_switch_case_blocks(int x)
{
    int a = x + 10;
    int b = x * 2;
    int c = 0;
    int result = 0;

    switch (x & 3) {
        case 0:
            c = a + b;
            c *= 2;
            result = c - x;
            break;

        case 1:
            c = a - b;
            c *= 3;
            result = c + x;
            break;

        case 2:
            c = a * b;
            c -= 7;
            result = c ^ x;
            break;

        default:
            c = a ^ b;
            c += 100;
            result = c + x;
            break;
    }

    result += 17;

    return result;
}


/* ================================================================== */
/* 23. Nested switches with fallthrough                               */
/* ================================================================== */

int _23_switch_nested_fallthrough(int x)
{
    int result = 0;

    switch (x & 1) {
        case 0:
            switch (x & 3) {
                case 0:
                    result += 10;

                case 2:
                    result += 20;
                    break;

                default:
                    result = -10;
                    break;
            }
            break;

        case 1:
            switch (x & 3) {
                case 1:
                    result += 30;

                case 3:
                    result += 40;
                    break;

                default:
                    result = -20;
                    break;
            }
            break;
    }

    return result;
}


/* ================================================================== */
/* 24. Large switch                                                   */
/* ================================================================== */

int _24_switch_large(int x)
{
    int result = 0;

    switch (x) {
        case 0:
            result = 100;
            break;

        case 1:
            result = 101;
            break;

        case 2:
            result = 102;
            break;

        case 3:
            result = 103;
            break;

        case 4:
            result = 104;
            break;

        case 5:
            result = 105;
            break;

        case 6:
            result = 106;
            break;

        case 7:
            result = 107;
            break;

        case 8:
            result = 108;
            break;

        case 9:
            result = 109;
            break;

        case 10:
            result = 110;
            break;

        case 20:
            result = 120;
            break;

        case 50:
            result = 150;
            break;

        case 100:
            result = 200;
            break;

        default:
            result = -1;
            break;
    }

    return result;
}


/* ================================================================== */
/* 25. Sparse switch values                                           */
/* ================================================================== */

int _25_switch_sparse(int x)
{
    int result = 0;

    switch (x) {
        case -1000:
            result = 1;
            break;

        case -17:
            result = 2;
            break;

        case -1:
            result = 3;
            break;

        case 0:
            result = 4;
            break;

        case 7:
            result = 5;
            break;

        case 42:
            result = 6;
            break;

        case 1337:
            result = 7;
            break;

        case 65535:
            result = 8;
            break;

        default:
            result = 999;
            break;
    }

    return result;
}


/* ================================================================== */
/* 26. Multiple nested levels + computed keys                          */
/* ================================================================== */

int _26_switch_very_nested(int x)
{
    int a = (x ^ 0x1234) & 15;
    int b = (x * 3 + 7) & 7;
    int c = (a ^ b) & 3;
    int result = 0;

    switch (a & 3) {
        case 0:
            switch (b & 3) {
                case 0:
                    switch (c) {
                        case 0:
                            result = 1000;
                            break;

                        case 1:
                            result = 1001;
                            break;

                        default:
                            result = 1002;
                            break;
                    }
                    break;

                case 1:
                    result = 1010;
                    break;

                default:
                    result = 1020;
                    break;
            }
            break;

        case 1:
            switch (b & 3) {
                case 0:
                    result = 1100;
                    break;

                case 1:
                    switch (c) {
                        case 0:
                            result = 1110;
                            break;

                        case 1:
                            result = 1111;
                            break;

                        case 2:
                            result = 1112;
                            break;

                        default:
                            result = 1113;
                            break;
                    }
                    break;

                default:
                    result = 1120;
                    break;
            }
            break;

        case 2:
            switch (c) {
                case 0:
                    result = 1200;
                    break;

                case 1:
                    result = 1201;
                    break;

                default:
                    result = 1299;
                    break;
            }
            break;

        default:
            result = 1300;
            break;
    }

    return result + x;
}


/* ================================================================== */
/* 27. Goto + nested switch + array                                    */
/* ================================================================== */

int _27_switch_goto_nested_array(int x)
{
    int values[4] = {100, 200, 300, 400};
    int result = 0;
    int key = x & 3;

    switch (key) {
        case 0:
            goto OUTER_ZERO;

        case 1:
            goto OUTER_ONE;

        case 2:
            goto OUTER_TWO;

        default:
            goto OUTER_THREE;
    }

OUTER_ZERO:
    switch (x & 7) {
        case 0:
            result = values[0];
            break;

        case 4:
            result = values[1];
            break;

        default:
            result = -1;
            break;
    }
    goto DONE;

OUTER_ONE:
    switch (x & 7) {
        case 1:
            result = values[1];
            break;

        case 5:
            result = values[2];
            break;

        default:
            result = -2;
            break;
    }
    goto DONE;

OUTER_TWO:
    switch (x & 7) {
        case 2:
            result = values[2];
            break;

        case 6:
            result = values[3];
            break;

        default:
            result = -3;
            break;
    }
    goto DONE;

OUTER_THREE:
    switch (x & 7) {
        case 3:
            result = values[3];
            break;

        case 7:
            result = values[0] + values[3];
            break;

        default:
            result = -4;
            break;
    }

DONE:
    return result;
}


/* ================================================================== */
/* 28. Switch with pointer-to-pointer                                 */
/* ================================================================== */

int _28_switch_pointer_to_pointer(int x)
{
    int a = 10;
    int b = 20;
    int c = 30;

    int *pa = &a;
    int *pb = &b;
    int *pc = &c;

    int **selected = &pa;

    switch (x % 3) {
        case 0:
            selected = &pa;
            break;

        case 1:
            selected = &pb;
            break;

        default:
            selected = &pc;
            break;
    }

    return **selected + x;
}


/* ================================================================== */
/* 29. Final combination                                               */
/* ================================================================== */

int _29_switch_combined(int x)
{
    int values[8] = {
        3, 7, 11, 19,
        23, 31, 43, 59
    };

    int *ptr = values;
    int result = 0;

    int key1 = (x ^ 0xAA) & 7;
    int key2 = (x * 7 + 3) & 3;

    switch (key1) {
        case 0:
            ptr = &values[0];
            break;

        case 1:
            ptr = &values[1];
            break;

        case 2:
            ptr = &values[2];
            break;

        case 3:
            ptr = &values[3];
            break;

        case 4:
            ptr = &values[4];
            break;

        case 5:
            ptr = &values[5];
            break;

        case 6:
            ptr = &values[6];
            break;

        default:
            ptr = &values[7];
            break;
    }

    switch (key2) {
        case 0:
            switch (*ptr & 3) {
                case 0:
                    result = *ptr + 100;
                    break;

                case 1:
                    result = *ptr + 200;
                    break;

                case 2:
                    result = *ptr + 300;
                    break;

                default:
                    result = *ptr + 400;
                    break;
            }
            break;

        case 1:
            result = *ptr * 2;
            break;

        case 2:
            result = *ptr * 3;
            break;

        default:
            result = *ptr * 4;
            break;
    }

    return result + x;
}


/* ================================================================== */
/* Driver                                                              */
/* ================================================================== */

int main(int argc, char **argv)
{
    int a = 4;

    switch (argc) {
        case 1:
            a = 4;
            break;

        default:
            a = atoi(argv[1]);
            break;
    }

    int result = 0;

    result += _00_switch_simple(a);
    result += _01_switch_default(a);
    result += _02_switch_negative(a);
    result += _03_switch_fallthrough(a);
    result += _04_switch_fallthrough_steps(a);
    result += _05_switch_before_after(a);
    result += _06_switch_multiple(a);
    result += _07_switch_two_independent(a);
    result += _08_switch_expression(a);
    result += _09_switch_bitwise(a);
    result += _10_switch_array(a);
    result += _11_switch_pointer(a);
    result += _12_switch_pointer_modify(a);
    result += _13_switch_nested(a);
    result += _14_switch_deep_nested(a);
    result += _15_switch_nested_array(a);
    result += _16_switch_nested_pointer(a);
    result += _17_switch_goto(a);
    result += _18_switch_multiple_goto(a);
    result += _19_switch_nested_goto(a);
    result += _20_switch_precomputed(a);
    result += _21_switch_complex_data(a);
    result += _22_switch_case_blocks(a);
    result += _23_switch_nested_fallthrough(a);
    result += _24_switch_large(a);
    result += _25_switch_sparse(a);
    result += _26_switch_very_nested(a);
    result += _27_switch_goto_nested_array(a);
    result += _28_switch_pointer_to_pointer(a);
    result += _29_switch_combined(a);

    printf("%d\n", result);

    return 0;
}