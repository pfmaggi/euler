/*
 * By considering the terms in the Fibonacci sequence whose values do no
 * exceed four million, find the sum of the even-valued terms.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <inttypes.h>

int main(void) {

    u_int64_t first = 1;
    u_int64_t second = 2;
    u_int64_t sum = 0;
    u_int64_t swap = 0;

    while (second < 4000000) {
        if (second % 2 == 0) {
            sum += second;
        }
        swap = first;
        first = second;
        second = swap + second;
    }

    printf("Result = %"PRIu64"\n", sum);

    return EXIT_SUCCESS;
}
