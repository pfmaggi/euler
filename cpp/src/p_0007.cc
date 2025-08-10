#include "euler.h"

bool isPrime(uint64_t number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if ((number % 2 == 0) || (number % 3 == 0)) return false;
    uint64_t i{5};
    while (i * i <= number) {
        if ((number % i == 0) || (number % (i + 2) == 0)) return false;
        i += 6;
    }
    return true;
}

int euler_0007(uint64_t limit) {
    uint64_t count{0};
    uint64_t candidate{2};
    while (count < limit) {
        if (isPrime(candidate)) {
            ++count;
        }
        ++candidate;
    }
    return candidate - 1;
}
