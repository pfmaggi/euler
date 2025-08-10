#include "euler.h"

uint compute_len(uint number, const std::vector<uint>& array) {
    uint value{number};
    uint count{1};
    while (value > 1) {
        if (value < number) {
            return count + array[value] - 1;
        }
        ++count;
        if (value % 2 == 0) {
            value /= 2;
        } else {
            value = (3 * value) + 1;
        }
    }
    return count;
}

uint euler_0014(uint limit) {
    std::vector<uint> array(limit + 1);

    uint max{0};
    uint result{1};
    for (uint i{1}; i <= limit; i++) {
        uint count = compute_len(i, array);
        array[i] = count;
        if (count > max) {
            max = count;
            result = i;
        }
    }
    return result;
}
