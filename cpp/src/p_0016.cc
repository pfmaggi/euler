#include "euler.h"

// Compute the sum of the digits of 2^exponent
int euler_0016(int exponent) {
    // Initialize a vector to store the digits of 2^exponent
    std::vector<int> digits(exponent, 0);
    digits[0] = 1;  // Start with 2^0 = 1

    int carry{0};
    int length{1};  // Current number of digits

    // Multiply by 2 repeatedly to compute 2^exponent
    for (int i{0}; i < exponent; ++i) {
        carry = 0;
        for (int j{0}; j < length; ++j) {
            int product{digits[j] * 2 + carry};
            digits[j] = product % 10;
            carry = product / 10;
        }

        // If there's a carry after the last digit, increase the length
        while (carry > 0) {
            digits[length++] = carry % 10;
            carry /= 10;
        }
    }

    return std::accumulate(digits.begin(), digits.begin() + length, 0);
}
