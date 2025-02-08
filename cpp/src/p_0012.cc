#include "euler.h"

constexpr auto count_divisors(uint64_t num) -> uint64_t {
    if (num == 0) return 0;
    uint64_t divisors = 1;
    uint64_t current = num;

    // Factor out 2s
    uint64_t exponent = 0;
    while ((current & 1) == 0) {
        ++exponent;
        current >>= 1;
    }
    if (exponent > 0) divisors *= (exponent + 1);

    // Check odd factors
    for (uint64_t i = 3; i * i <= current; i += 2) {
        exponent = 0;
        while (current % i == 0) {
            ++exponent;
            current /= i;
        }
        if (exponent > 0) divisors *= (exponent + 1);
    }

    if (current > 1) divisors *= 2;
    return divisors;
}

uint64_t euler_0012(uint64_t target) {
    const auto triangle_divisors = [](uint64_t n) {
        const auto a = (n & 1) ? n : n / 2;
        const auto b = (n & 1) ? (n + 1) / 2 : n + 1;
        return count_divisors(a) * count_divisors(b);
    };

    uint64_t n = 1;
    while (triangle_divisors(n) <= target) ++n;

    return (n & 1) ? n * (n + 1) / 2 : (n / 2) * (n + 1);
}
