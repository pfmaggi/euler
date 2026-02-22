use crate::{ProblemFactory, Runner};

pub struct Problem3;

impl Runner for Problem3 {
    fn id(&self) -> u32 {
        3
    }

    fn name(&self) -> &str {
        "Largest Prime Factor"
    }

    fn expected_answer(&self) -> &str {
        "6857"
    }

    fn solve(&self) -> String {
        let mut n: u64 = 600_851_475_143;
        let mut factor = 2;
        let mut last_factor = 1;

        // Handle 2 separately so we can increment by 2 later
        if n % factor == 0 {
            last_factor = factor;
            while n % factor == 0 {
                n /= factor;
            }
        }

        factor = 3;
        // Optimization: A number N can have at most one prime factor greater than sqrt(N)
        while n > 1 && factor * factor <= n {
            if n % factor == 0 {
                last_factor = factor;
                while n % factor == 0 {
                    n /= factor;
                }
            }
            factor += 2; // Skip even numbers
        }

        // If n > 1, the remaining n is the largest prime factor
        let result = if n > 1 { n } else { last_factor };

        result.to_string()
    }
}

inventory::submit! {
    ProblemFactory {
        create: || Box::new(Problem3) as Box<dyn Runner>
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_p_0003() {
        let p = Problem3;
        assert_eq!(p.solve(), p.expected_answer());
    }
}
