/* Find the sum of all the multiples of 3 and 5 below 1000 */

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
}

#[cfg(test)]
mod test {
    use super::*;
    #[test]
    fn test_p001() {
        assert_eq!(Problem1.solve(), "233168");
    }
}
