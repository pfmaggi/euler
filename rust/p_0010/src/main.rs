// Euler problem 10:
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

use structopt::StructOpt;

#[derive(StructOpt)]
struct Opt {
    /// Upper limit for the primes to sum
    #[structopt(short, long, default_value = "2000000")]
    limit: u64,
}

fn find_primes(limit: u64)-> u64 {
    let mut primes: Vec<u64> = Vec::new();
    let mut sum: u64 = 2;
    primes.push(2);
    for candidate in (3..limit).step_by(2) {
        let mut is_prime = true;
        for i in &primes {
            if candidate % i == 0 {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            primes.push(candidate);
            sum += candidate;
        }

    }

    return sum
}

fn main() {
    let args = Opt::from_args();
    println!("The sum of all the primes below {} is: {}", args.limit, find_primes(args.limit));
}
