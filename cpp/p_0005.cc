#include <iostream>

unsigned long long gcd(unsigned long long a, unsigned long long b) {
    if (b == 0) {
        return a;
    }
    return gcd(b, a % b);
}

unsigned long long lcm(unsigned long long a, unsigned long long b) {
    return a * b / gcd(a, b);
}

int main() {
    unsigned long long result = 1;
    for (unsigned long long i = 1; i <= 20; ++i) {
        result = lcm(result, i);
    }

    std::cout << result << std::endl;
    return 0;
}
