#include <iostream>
#include <numeric>
#include <ranges>

unsigned long gcd(auto a, auto b) { return (b == 0) ? a : gcd(b, a % b); }

auto lcm(unsigned long a, unsigned long b) { return a * b / gcd(a, b); }

auto p_0005(int max) {
    auto numbers = std::ranges::iota_view{2, max + 1};
    return std::accumulate(
        numbers.begin(), numbers.end(), 1,
        [](unsigned long result, int x) { return lcm(result, x); });
}

int main() {
    auto result = p_0005(20);

    std::cout << "Problem 0005: The smallest positive number that is divisible "
                 "by all of the numbers up to 20: "
              << result << std::endl;
    return 0;
}
