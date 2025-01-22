/*
 * By considering the terms in the Fibonacci sequence whose values do not
 * exceed four million, find the sum of the even-valued terms.
 */

#include <iostream>

int sum_even_fibonacci(int limit) {
    // Return the sum of the even-valued terms.
    int total{};
    int first{1};
    int second{2};
    while (second < limit) {
        if (second % 2 == 0) total += second;
        int temp{second};
        second += first;
        first = temp;
    }
    return total;
}

int main() {
    std::cout
        << "Problem 0002: Sum of even-valued fibonacci terms below 4000000 is: "
        << sum_even_fibonacci(4000000) << '\n';
}
