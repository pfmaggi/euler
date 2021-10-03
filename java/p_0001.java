/*
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */

// import java.util.stream.IntStream;

public class p_0001 {
    public static void main(String [] args) {
        int sum = 0;
        for (int i = 1; i < 1000; i++) {
            if ((i%3 == 0) || (i%5 == 0)) {
                sum += i;
            }
        }
        // long sum = IntStream.range(0, 1000).filter(item -> (item%3 == 0) || (item%5 == 0)).reduce(0, (a,b)->a+b);
        System.out.printf("Sum is %d\n", sum);
    }
}
