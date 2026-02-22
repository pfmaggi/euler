use crate::{ProblemFactory, Runner};

pub struct Problem2;

/// An iterator that yields Fibonacci numbers: 1, 2, 3, 5, 8, 13...
struct Fibonacci {
    curr: u32,
    next: u32,
}

impl Fibonacci {
    fn new() -> Self {
        Fibonacci { curr: 1, next: 2 }
    }
}

impl Iterator for Fibonacci {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        let current = self.curr;
        self.curr = self.next;
        self.next = current + self.next;
        Some(current)
    }
}

impl Runner for Problem2 {
    fn id(&self) -> u32 {
        2
    }

    fn name(&self) -> &str {
        "Even Fibonacci Numbers"
    }

    fn expected_answer(&self) -> &str {
        "4613732"
    }

    fn solve(&self) -> String {
        let limit = 4_000_000;

        let result: u32 = Fibonacci::new()
            .take_while(|&x| x <= limit) // Stop when values exceed 4 million
            .filter(|&x| x % 2 == 0) // Keep only even numbers
            .sum();

        result.to_string()
    }
}

// Register with inventory
inventory::submit! {
    ProblemFactory {
        create: || Box::new(Problem2) as Box<dyn Runner>
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_p_0002() {
        let p = Problem2;
        assert_eq!(p.solve(), p.expected_answer());
    }
}
