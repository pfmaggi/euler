/*
 * What is the largest prime factor of the number 600851475143?
 */

#include <iostream>

unsigned long findLargestPrimeFactor(unsigned long number) {
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
    std::cout << "Result = " << findLargestPrimeFactor(600851475143) << '\n';
}
