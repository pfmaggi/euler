/*
 * What is the largest prime factor of the number 600851475143?
 */

#include <cstdint>
#include <iostream>

uint64_t findLargestPrimeFactor(uint64_t number) {
    auto result{0};
    while (number % 2 == 0) {
        result = 2;
        number /= 2;
    }
    for (auto i{3}; i < number; i += 2) {
        while (number % i == 0) {
            result = i;
            number /= i;
        }
    }

    if (number > 2) result = number;

    return result;
}

int main() {
    std::cout << "Problem 0003: The largest prime factor of the number "
                 "600851475143 is: "
              << findLargestPrimeFactor(600851475143) << '\n';
}
