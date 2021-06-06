// Euler problem 10:
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

fn find_primes(limit: u64)-> Vec<u64> {
    let mut primes: Vec<u64> = Vec::new();
    primes.push(2);
    for candidate in 2..limit {
        let mut is_prime = true;
        for i in &primes {
            if candidate % i == 0 {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            primes.push(candidate);
        }

    }

    return primes
}

fn main() {
    println!("The sum of all the primes below two million is: {}", find_primes(2000000).iter().sum::<u64>());
}
