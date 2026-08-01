#include <stdio.h>

int multiply(int a, int b) {
    return a * b;
}

int pack_color(int red, int green, int blue, int alpha) {
    return (red << 24) | (green << 16) | (blue << 8) | alpha;
}

long build_record(int id, double weight, char grade, long timestamp) {
    long score = (long)(weight * 100);
    if (grade == 'A')
        score += 50;
    return id + score + timestamp;
}

int negate(int value) {
    return -value;
}

int constant_answer(void) {
    return 42;
}

int factorial(int n) {
    if (n <= 1)
        return 1;
    return n * factorial(n - 1);
}
