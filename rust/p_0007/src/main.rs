
fn find_prime(count: u32)-> u128 {
    let mut prime_num: u32 = 1;
    let mut candidate = 2;
    let mut v: Vec<u128> = Vec::new();
    v.push(2);
    while prime_num < count {
        candidate += 1;
        let mut is_prime = true;
        for i in &v {
            if candidate % i == 0 {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            prime_num += 1;
            v.push(candidate);
        }

    }

    return candidate
}

fn main() {
    println!("the 10001th prime is: {}", find_prime(10001));
}
