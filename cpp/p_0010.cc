#include <cstdint>
#include <iostream>
#include <vector>

// Function to compute the sum of primes below a given limit using the Sieve of
// Eratosthenes
uint64_t euler_0010(uint64_t limit) {
    if (limit < 2) return 0;

    // false means prime, true means marked (not prime)
    std::vector<bool> marked(limit, false);
    uint64_t sum{2};  // Start with 2, the only even prime

    // Mark multiples of primes starting from 3
    for (uint64_t value{3}; value < limit; value += 2) {
        if (!marked[value]) {
            sum += value;
            // We start marking from the squared value as the smallest multiples
            // are already taken care of.
            for (uint64_t i{value * value}; i < limit; i += value) {
                marked[i] = true;
            }
        }
    }

    return sum;
}

int main() {
    auto result = euler_0010(2'000'000);
    std::cout
        << "Problem 0010: The sum of all the primes below two million is: "
        << result << '\n';

    return 0;
}
