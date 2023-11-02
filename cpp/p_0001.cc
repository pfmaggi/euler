/* Find the sum of all the multiples of 3 and 5 below 1000 */

#include <stdio.h>
#include <stdlib.h>

int main(void) {

    int sum = 0;
    for (int i=0; i<1000; i++) {
        if (i % 3 == 0) {
            sum += i;
        } else if (i % 5 == 0) {
            sum += i;
        }
    }

    printf("Result = %d\n", sum);

    return EXIT_SUCCESS;
}
