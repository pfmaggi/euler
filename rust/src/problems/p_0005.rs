use crate::Runner;

pub struct Problem5;

impl Runner for Problem5 {
    fn id(&self) -> u32 {
        5
    }
    fn name(&self) -> &str {
        "Problem 5"
    }

    fn solve(&self) -> String {
        let result: u64 = (1..=20).fold(1, lcm);
        result.to_string()
    }
}

fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn lcm(a: u64, b: u64) -> u64 {
    a * b / gcd(a, b)
}
