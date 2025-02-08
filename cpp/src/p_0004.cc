// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.

#include "euler.h"

bool is_palindrome(int num) {
    std::string s = std::to_string(num);
    return std::equal(s.begin(), s.begin() + s.size() / 2, s.rbegin());
}

std::pair<int, int> euler_0004(int limit) {
    int upper = std::pow(10, limit);

    int largest_palindrome{0};
    std::pair<int, int> factors;
    for (int i{100}; i < upper; i++) {
        for (int j{i}; j < upper; j++) {
            int product{i * j};
            if (is_palindrome(product) && (product > largest_palindrome)) {
                largest_palindrome = product;
                factors = std::pair<int, int>(i, j);
            }
        }
    }

    return factors;
}
