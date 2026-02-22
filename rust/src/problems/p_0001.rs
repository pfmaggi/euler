/* Find the sum of all the multiples of 3 and 5 below 1000 */

use project_euler::ProblemFactory;

use crate::Runner;

pub struct Problem1;

impl Runner for Problem1 {
    fn id(&self) -> u32 {
        1
    }

    fn name(&self) -> &str {
        "Multiple of 3 and 5"
    }

    fn solve(&self) -> String {
        let limit = 1000;
        let result: u32 = (1..limit).filter(|x| x % 3 == 0 || x % 5 == 0).sum();
        result.to_string()
    }

    fn expected_answer(&self) -> &str {
        "233168"
    }
}

// This register the problem automatically at compile time
inventory::submit! {
    ProblemFactory {
        create: || Box::new(Problem1) as Box<dyn Runner>
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_p_0001() {
        let p = Problem1;
        assert_eq!(p.solve(), p.expected_answer());
    }
}
