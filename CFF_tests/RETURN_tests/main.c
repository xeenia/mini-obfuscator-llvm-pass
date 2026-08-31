#include <stdio.h>

int absolute_value(int x) {
    if (x < 0)
        return -x;

    return x;
}

int classify_number(int x) {
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

int sum_until(int limit) {
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

int find_first_divisible(int start, int end, int divisor) {
    for (int i = start; i <= end; i++) {
        if (i % divisor == 0)
            return i;
    }

    return -1;
}

int calculate_score(int x) {
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

int main(void) {
    int numbers[] = { -4, 0, 3, 8, 11 };
    int size = 5;

    for (int i = 0; i < size; i++) {
        int x = numbers[i];

        printf("Number: %d\n", x);
        printf("Absolute value: %d\n", absolute_value(x));

        int type = classify_number(x);

        if (type == 0)
            printf("Zero\n");
        else if (type == 1)
            printf("Positive odd\n");
        else if (type == 2)
            printf("Positive even\n");
        else
            printf("Negative\n");
    }

    int sum = sum_until(10);
    printf("Sum until 10: %d\n", sum);

    int result = find_first_divisible(3, 20, 7);

    if (result != -1)
        printf("First number divisible by 7: %d\n", result);
    else
        printf("No number divisible by 7 found\n");

    printf("Score: %d\n", calculate_score(10));

    return 0;
}