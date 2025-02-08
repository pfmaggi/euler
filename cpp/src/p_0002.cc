/*
 * By considering the terms in the Fibonacci sequence whose values do not
 * exceed four million, find the sum of the even-valued terms.
 */

#include "euler.h"

int euler_0002(int limit) {
    // Return the sum of the even-valued terms.
    int total{};
    int first{1};
    int second{2};
    while (second < limit) {
        if (second % 2 == 0) total += second;
        int temp{second};
        second += first;
        first = temp;
    }
    return total;
}
