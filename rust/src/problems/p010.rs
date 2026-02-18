// Euler problem 10:
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

use bit_vec::BitVec;

use crate::Runner;

pub struct Problem10;

impl Runner for Problem10 {
    fn id(&self) -> u32 {
        10
    }
    fn name(&self) -> &str {
        "Sum of all primes below two millions"
    }

    fn solve(&self) -> String {
        let limit = 2000000;
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
        return sum.to_string();
    }
}
