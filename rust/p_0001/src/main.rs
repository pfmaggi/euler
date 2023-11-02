/* Find the sum of all the multiples of 3 and 5 below 1000 */

fn find_sum_multiples_of_3_and_5(limit: u32)-> u128 {
    let mut sum: u128 = 0;
    let mut value: u128 = 1;
    while value < limit.into() {
        if value % 3 == 0 {
            sum += value;
        } else if value % 5 == 0 {
            sum += value;
        }
        value += 1;
    }

    return sum
}

fn main() {
    println!("The sum of the multiples of 3 and 5 below 1000 is: {}", find_sum_multiples_of_3_and_5(1000));
}
