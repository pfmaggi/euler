/* Find the sum of all the multiples of 3 and 5 below 1000 */

fn find_sum_multiples_of_3_and_5(limit: u32) -> u32 {
    (1..limit).filter(|x| x % 3 == 0 || x % 5 == 0).sum()
}

fn sum_multiples_of(k: u32, limit: u32) -> u32 {
    let n = (limit - 1) / k; // Number of muktiples below the limit
    k * n * (n + 1) / 2 // Sum of arithmetic progression
}

fn find_sum_fast(limit: u32) -> u32 {
    let sum_3 = sum_multiples_of(3, limit);
    let sum_5 = sum_multiples_of(5, limit);
    let sum_15 = sum_multiples_of(15, limit);

    sum_3 + sum_5 - sum_15
}

fn main() {
    let limit = 1000;
    let result = find_sum_multiples_of_3_and_5(limit);
    println!("The sum of the multiples of 3 and 5 below {limit} is: {result}");
    println!("The fast sum is {}", find_sum_fast(limit));
}
