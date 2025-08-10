// Find the difference between the sum of the squares of the first one hundred
// natural numbers and the square of the sum

#include "euler.h"
#include "iota_view.h"

// Function to calculate the sum of squares up to a given number
auto sum_of_squares(int upper_bound) {
    // Use std::accumulate with a lambda for efficient summation of squares
    auto numbers = iota_view{1, upper_bound + 1};
    return std::accumulate(
        numbers.begin(), numbers.end(), 0,
        [](uint64_t sum, int num) { return sum + (num * num); });
}

// Function to calculate the square of the sum up to a given number
auto square_of_sum(int upper_bound) {
    // Use std::accumulate for summation and then square the result
    auto numbers = iota_view{1, upper_bound + 1};
    uint64_t sum = std::accumulate(numbers.begin(), numbers.end(), 0);
    return sum * sum;
}

uint64_t euler_0006(int upper_bound) {
    return square_of_sum(upper_bound) - sum_of_squares(upper_bound);
}
