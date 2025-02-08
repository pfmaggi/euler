/* Find the sum of all the multiples of 3 and 5 below 1000 */

#include "euler.h"
#include "iota_view.h"

int euler_0001(int max) {
    auto numbers = iota_view{1, max};
    return std::accumulate(numbers.begin(), numbers.end(), 0,
                           [](int sum, int x) {
                               if ((x % 3 == 0) || (x % 5 == 0)) {
                                   sum += x;
                               }
                               return sum;
                           });
}
