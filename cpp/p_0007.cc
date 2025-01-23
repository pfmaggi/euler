#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

int find_prime_number(int count) {
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

int main() {
    int nth_prime = find_prime_number(10001);
    std::cout << "Problem 0007: The 10001st prime number is: " << nth_prime
              << std::endl;
    return 0;
}
