#include <stdio.h>

int _0_absolute_value(int x) {
    if (x < 0)
        return -x;

    return x;
}

int _1_classify_number(int x) {
    if (x == 0)
        return 0;

    if (x > 0) {
        if (x % 2 == 0)
            return 2;
        else
            return 1;
    }

    return -1;
}

int _2_sum_until(int limit) {
    int sum = 0;
    int i = 0;

    while (i <= limit) {
        if (i == 5)
            return sum;

        sum += i;
        i++;
    }

    return sum;
}

int _3_find_first_divisible(int start, int end, int divisor) {
    for (int i = start; i <= end; i++) {
        if (i % divisor == 0)
            return i;
    }

    return -1;
}

int _4_calculate_score(int x) {
    int score = 0;

    if (x < 0)
        return -1;

    for (int i = 1; i <= x; i++) {
        if (i % 2 == 0) {
            score += i;
        } else {
            score += 1;
        }

        if (score > 20)
            return score;
    }

    return score;
}

/* ---------- 5: return from inside a nested loop (breaks two levels) ---------- */
int _5_find_pair_in_grid(int rows, int cols, int target) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (i * cols + j == target)
                return i * 100 + j; // encodes row/col, exits both loops at once
        }
    }

    return -1;
}

/* ---------- 6: return from inside a do-while ---------- */
int _6_first_negative_do_while(int start, int count) {
    int i = 0;
    int value = start;

    do {
        if (value < 0)
            return value;

        value -= 3;
        i++;
    } while (i < count);

    return 0;
}

/* ---------- 7: void function, bare "return;" as an early exit ---------- */
void _7_validate_and_print(int x) {
    if (x < 0) {
        printf("_7_validate_and_print: invalid input\n");
        return;
    }

    printf("_7_validate_and_print: valid input %d\n", x);
}

int main(void) {
    int numbers[] = { -4, 0, 3, 8, 11 };
    int size = 5;

    for (int i = 0; i < size; i++) {
        int x = numbers[i];

        printf("Number: %d\n", x);
        printf("Absolute value: %d\n", _0_absolute_value(x));

        int type = _1_classify_number(x);

        if (type == 0)
            printf("Zero\n");
        else if (type == 1)
            printf("Positive odd\n");
        else if (type == 2)
            printf("Positive even\n");
        else
            printf("Negative\n");
    }

    int sum = _2_sum_until(10);
    printf("Sum until 10: %d\n", sum);

    int result = _3_find_first_divisible(3, 20, 7);

    if (result != -1)
        printf("First number divisible by 7: %d\n", result);
    else
        printf("No number divisible by 7 found\n");

    printf("Score: %d\n", _4_calculate_score(10));

    printf("Pair found at: %d\n", _5_find_pair_in_grid(3, 3, 4));   // found
    printf("Pair found at: %d\n", _5_find_pair_in_grid(3, 3, 100)); // not found

    printf("First negative: %d\n", _6_first_negative_do_while(5, 3));   // hits early return
    printf("First negative: %d\n", _6_first_negative_do_while(100, 2)); // falls through

    _7_validate_and_print(-1); // early return branch
    _7_validate_and_print(5);  // normal branch

    return 0;
}