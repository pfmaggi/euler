#include "euler.h"

int euler_0007(unsigned int count) {
    std::vector<int> primes;
    int candidate = 2;
    while (primes.size() < count) {
        ++candidate;
        if (std::none_of(primes.cbegin(), primes.cend(),
                         [candidate](int i) { return candidate % i == 0; })) {
            primes.push_back(candidate);
        }
    }
    return primes.back();
}
