mod problems;
use project_euler::{ProblemFactory, Runner};
use std::env;
use std::time::{Duration, Instant};

fn main() {
    // Collect all submitted problems and sort them by ID
    let mut all_problems: Vec<_> = inventory::iter::<ProblemFactory>
        .into_iter()
        .map(|factory| (factory.create)())
        .collect();

    all_problems.sort_by_key(|p| p.id());

    let args: Vec<String> = env::args().collect();

    if args.len() > 1 && args[1] == "all" {
        run_all(all_problems);
    } else if args.len() > 1 {
        // Run a specific problem by index (e.g. "cargo run 1")
        let idx: usize = args[1].parse::<usize>().unwrap_or(0);
        if idx > 0 && idx <= all_problems.len() {
            run_single(&*all_problems[idx - 1]);
        } else {
            println!("Problem {idx} not found or not registered.");
        }
    } else {
        println!(
            "Usage:\n   cargo run all        - Run all problems\n   cargo run <num>     - Run specific problem"
        );
    }
}

fn run_single(p: &dyn Runner) -> Duration {
    println!("--- Problem {}: {} ---", p.id(), p.name());
    let start = Instant::now();
    let result = p.solve();
    let duration = start.elapsed();

    println!("Result: {result}");
    println!("Time:   {:?}", duration);
    duration
}

fn run_all(problems: Vec<Box<dyn Runner>>) {
    let mut total_time = Duration::new(0, 0);

    println!("Executing all registered Prject Euler solutions...");

    for p in &problems {
        total_time += run_single(p.as_ref());
        println!();
    }

    println!("========================================");
    println!("Total Execution Time: {:?}", total_time);
    println!("========================================");
}
