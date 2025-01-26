#include <cmath>
#include <cstdint>
#include <iostream>

// Function to calculate the number of divisors of a number
uint64_t count_divisors(uint64_t n) {
    uint64_t count = 0;
    for (uint64_t i = 1; i <= std::sqrt(n); ++i) {
        if (n % i == 0) {
            // If divisors are equal, count only one
            if (n / i == i) {
                ++count;
            } else {
                // Otherwise, count both
                count += 2;
            }
        }
    }
    return count;
}

auto euler_12(int target_divisors) {
    uint64_t triangular_number{0};

    uint64_t divisors{0};
    for (uint64_t n{1}; divisors <= target_divisors; n++) {
        // Calculate the number of divisors of the current triangular number
        triangular_number += n;
        divisors = count_divisors(triangular_number);
    }
    return triangular_number;
}

int main() {
    std::cout << "Problem 0012: The first triangular number with over 500 "
                 "divisors is: "
              << euler_12(500) << '\n';

    return 0;
}
