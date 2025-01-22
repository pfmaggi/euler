/* Find the sum of all the multiples of 3 and 5 below 1000 */

#include <iostream>
#include <numeric>
#include <ranges>

auto p_0001(int max) {
    auto numbers = std::ranges::iota_view{1, max};
    return std::accumulate(numbers.begin(), numbers.end(), 0,
                           [](int sum, int x) {
                               if ((x % 3 == 0) || (x % 5 == 0)) {
                                   sum += x;
                               }
                               return sum;
                           });
}

int main(void) {
    std::cout << "Problem 0001: Sum of multiples of 3 and 5 below 1000 is: "
              << p_0001(1000) << '\n';
}
