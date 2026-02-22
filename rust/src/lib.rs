pub trait Runner: Send + Sync {
    fn id(&self) -> u32;
    fn name(&self) -> &str;
    fn solve(&self) -> String; // Use String to handle different return types
    fn expected_answer(&self) -> &str;
}

// Define a local struct to wrap the function pointer
pub struct ProblemFactory {
    pub create: fn() -> Box<dyn Runner>,
}

// Register THIS local struct with inventory
inventory::collect!(ProblemFactory);

// pub mod problems;

#[cfg(test)]
mod euler_test {
    use super::*;

    #[test]
    fn validate_all_solutions() {
        // Collect all problems from the inventory
        let mut all_problems: Vec<Box<dyn Runner>> = inventory::iter::<ProblemFactory>
            .into_iter()
            .map(|factory| (factory.create)())
            .collect();

        all_problems.sort_by_key(|p| p.id());

        let mut failures = Vec::new();

        for p in all_problems {
            let result = p.solve();
            if result != p.expected_answer() {
                failures.push(format!(
                    "Problem {}: Expected {}, got {}",
                    p.id(),
                    p.expected_answer(),
                    result
                ));
            }
        }

        if !failures.is_empty() {
            panic!("The following problems failed:\n{}", failures.join("\n"));
        }
    }
}
