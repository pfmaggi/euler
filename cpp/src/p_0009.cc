#include <cassert>

#include "euler.h"

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
