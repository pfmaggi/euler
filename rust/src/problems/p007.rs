use crate::Runner;

pub struct Problem7;

impl Runner for Problem7 {
    fn id(&self) -> u32 {
        7
    }
    fn name(&self) -> &str {
        "Problem 7"
    }

    fn solve(&self) -> String {
        let mut prime_num: u32 = 1;
        let mut candidate = 2;
        let mut v: Vec<u128> = Vec::new();
        v.push(2);
        while prime_num <= 10000 {
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
        candidate.to_string()
    }
}
