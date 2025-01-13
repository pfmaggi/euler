use std::collections::HashMap;

fn compute_factors(num: u32) -> HashMap<u32, u32> {
    let mut remainder = num;
    let mut factors = HashMap::new();

    for i in 2..=num {
        while remainder % i == 0 {
            remainder /= i;
            *factors.entry(i).or_insert(0) += 1;
        }
    }
    factors
}

fn common_factors(limit: u32) -> u32 {
    let mut factors = HashMap::new();
    let mut result = 1;

    for i in 2..=limit {
        for (k, v) in compute_factors(i) {
            let entry = factors.entry(k).or_insert(0);
            if *entry < v {
                *entry = v;
            }
        }
    }

    for (k, v) in factors {
        result *= k.pow(v);
    }

    result
}

fn main() {
    println!("{}", common_factors(20));
}
