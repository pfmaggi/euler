/* Find the sum of all the multiples of 3 and 5 below 1000 */

#include <cstdio>

auto p_0001(int max) {
    int sum{};

    for (int i{}; i<max; i++) {
        if (i % 3 == 0) {
            sum += i;
        } else if (i % 5 == 0) {
            sum += i;
        }
    }

    return sum;
}

int main(void) {
    printf("Result = %d\n", p_0001(1000));
}
