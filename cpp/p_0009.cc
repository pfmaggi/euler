#include <cassert>
#include <cmath>
#include <iostream>
#include <optional>
#include <tuple>

std::optional<int> is_pythagorean_triplet(int a, int b) {
    assert(a < b);
    int c2{a * a + b * b};
    int c = static_cast<int>(std::sqrt(c2));
    if (c2 == c * c) {
        return c;
    }
    return std::nullopt;
}

std::optional<std::tuple<int, int, int>> euler_0009(int sum) {
    for (int a = 1; a < sum / 2; ++a) {
        for (int b = a + 1; b < sum / 2; ++b) {
            if (auto result = is_pythagorean_triplet(a, b)) {
                int c = result.value();
                if (a + b + c == sum) {
                    std::tuple<int, int, int> result{a, b, c};
                    return result;
                }
            }
        }
    }
    return std::nullopt;
}

int main() {
    if (auto result = euler_0009(1000)) {
        int a, b, c;
        std::tie(a, b, c) = result.value();
        std::cout << "Problem 0009: The product of the Pythagorean triplet ("
                  << a << ", " << b << ", " << c << ") is: " << a * b * c
                  << std::endl;
    } else {
        std::cout << "No Pythagorean triplet found." << std::endl;
    }
    return 0;
}
