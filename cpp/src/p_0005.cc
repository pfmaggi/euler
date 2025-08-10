// What is the smallest positive number that is evenly divisible by all of the
// numbers from 1 to 20?

#include "euler.h"
#include "iota_view.h"

uint64_t gcd(uint64_t a, uint64_t b) { return (b == 0) ? a : gcd(b, a % b); }

auto lcm(uint64_t a, uint64_t b) { return a * b / gcd(a, b); }

uint64_t euler_0005(int max) {
    auto numbers = iota_view{2, max + 1};
    return std::accumulate(
        numbers.begin(), numbers.end(), 1,
        [](uint64_t result, int x) { return lcm(result, x); });
}
