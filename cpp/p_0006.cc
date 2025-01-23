#include <iostream>
#include <numeric>
#include <ranges>

// Function to calculate the sum of squares up to a given number
auto sum_of_squares(int upper_bound) {
    // Use std::accumulate with a lambda for efficient summation of squares
    auto numbers = std::ranges::iota_view{1, upper_bound + 1};
    return std::accumulate(
        numbers.begin(), numbers.end(), 0,
        [](unsigned long sum, int num) { return sum + (num * num); });
}

// Function to calculate the square of the sum up to a given number
auto square_of_sum(int upper_bound) {
    // Use std::accumulate for summation and then square the result
    auto numbers = std::ranges::iota_view{1, upper_bound + 1};
    unsigned long sum = std::accumulate(numbers.begin(), numbers.end(), 0);
    return sum * sum;
}

int main() {
    unsigned long difference = square_of_sum(100) - sum_of_squares(100);
    std::cout << "Problem 0006: Difference between the squares of sums and the "
                 "sum of squares: "
              << difference << '\n';
    return 0;
}
