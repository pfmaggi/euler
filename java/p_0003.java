/*
 * Euler problem 3
 * What is the largest prime factor of the number 600851475143?
 *
 * Result is 6857.
 *
 */

public class p_0003 {
    private static long findLargestPrimeFactor(long number) {
        long result = 0L;

        while (number % 2 == 0) {
            result = 2L;
            number = number / 2;
        }

        for (long i = 3; i < Math.sqrt((double)number) + 1; i += 2) {
            while (number % i == 0) {
                result = i;
                number = number / i;
            }
        }

        if (number > 2) {
            result = number;
        }

        return result;
    }

    public static void main(String [] args) {
        long value = 600851475143L;
        System.out.printf("Largest Prime Factor for %d is %d\n", value, findLargestPrimeFactor(value));
    }
}
