/*
 * Euler problem 2
 * By considering the terms in the Fibonacci sequence whose values do not
 * exceed four million, find the sum of the even-valued terms.
 *
 */

public class p_0002 {
  private static long sum_even_fibonacci(long limit) {
    long total = 0L;
    long first = 1L;
    long second = 2L;

    while (second < limit) {
      if (second % 2 == 0) {
        total += second;
      }

      long next = first + second;
      first = second;
      second = next;
    }

    return total;
  }

  public static void main(String [] args) {
    System.out.printf("The sum is %d\n", sum_even_fibonacci(4000000L));
  }
}
