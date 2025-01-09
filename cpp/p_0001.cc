/* Find the sum of all the multiples of 3 and 5 below 1000 */

#include <iostream>
#include <ranges>

auto p_0001(int max) {
    int sum{};

    for (int i : std::ranges::iota_view{1, max}) {
        if ((i % 3 == 0) || (i % 5 == 0)) {
            sum += i;
        }
    }

    return sum;
}

int main(void) { std::cout << "Result = " << p_0001(1000) << '\n'; }
