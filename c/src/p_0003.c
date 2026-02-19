/*
 * What is the largest prime factor of the number 600851475143?
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <inttypes.h>

u_int64_t findLargestPrimeFactor(u_int64_t number) {
    u_int64_t result = 0;
    while (number % 2 == 0) {
        result = 2;
        number /= 2;
    }
    u_int64_t i;
    for (i = 3; i < number; i += 2) {
        while (number % i == 0) {
            result = i;
            number /= i;
        }
    }

    if (number > 2) result = number;

    return result;
}

int main(void) {

    printf("Result = %"PRIu64"\n", findLargestPrimeFactor(600851475143));

    return EXIT_SUCCESS;
}
