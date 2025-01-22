// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.

#include <algorithm>
#include <cmath>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

bool is_palindrome(int num) {
    std::string s = std::to_string(num);
    return std::equal(s.begin(), s.begin() + s.size() / 2, s.rbegin());
}

int search_largest_palindrome(int limit) {
    int upper = std::pow(10, limit);
    std::vector<int> range(upper);
    std::iota(range.begin(), range.end(), 0);

    std::vector<int> products;
    for (int i : range) {
        for (int j : range) {
            products.push_back(i * j);
        }
    }

    auto palindrome_products =
        std::remove_if(products.begin(), products.end(),
                       [](int a) { return !is_palindrome(a); });

    products.erase(palindrome_products, products.end());

    if (products.empty()) {
        return 0;
    }

    return *std::max_element(products.begin(), products.end());
}

int main() {
    int result = search_largest_palindrome(3);
    std::cout << "Problem 0004: The largest palindrome made from the product "
                 "of two 3-digit numbers is: "
              << result << "\n";
    return 0;
}
