#include "euler.h"

uint array[1000000]{0};

uint compute_len(uint number) {
    uint value{number};
    uint count{1};
    while (value > 1) {
        ++count;
        if (value < number) {
            return count + array[value];
        }
        if (value % 2 == 0) {
            value /= 2;
        } else {
            value = (3 * value) + 1;
        }
    }
    return count;
}

uint euler_0014() {
    uint max{0};
    uint result{1};
    for (uint i{1}; i <= 1'000'000; i++) {
        uint count = compute_len(i);
        array[i] = count;
        if (count > max) {
            max = count;
            result = i;
        }
    }
    return result;
}
