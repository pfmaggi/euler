// Euler problem 10:
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

use structopt::StructOpt;
use bit_vec::BitVec;

#[derive(StructOpt)]
struct Opt {
    /// Upper limit for the primes to sum
    #[structopt(short, long, default_value = "2000000")]
    limit: usize,
}

fn find_primes_sieve(limit: usize)-> usize {
    let mut marked = BitVec::from_elem(limit, true);
    let mut value: usize = 3;
    let mut sum: usize = 2;
    while value < limit {
        if marked[value] {
            sum += value;
            let mut i = value;
            while i < limit {
                marked.set(i, false);
                i += value;
            }
        }
        value += 2;
    }
    return sum;
}

fn main() {
    let args = Opt::from_args();
    println!("The sum of all the primes below {} is: {}", args.limit, find_primes_sieve(args.limit));
}
