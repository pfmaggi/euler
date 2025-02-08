/*
 * What is the largest prime factor of the number 600851475143?
 */

#include "euler.h"

uint64_t euler_0003(uint64_t number) {
    auto result{0};
    while (number % 2 == 0) {
        result = 2;
        number /= 2;
    }
    for (uint64_t i{3}; i < number; i += 2) {
        while (number % i == 0) {
            result = i;
            number /= i;
        }
    }

    if (number > 2) result = number;

    return result;
}
