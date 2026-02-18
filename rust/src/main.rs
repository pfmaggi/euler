mod problems;
use project_euler::Runner;
use std::env;
use std::time::{Duration, Instant};

fn main() {
    // Register all implemented problems
    let all_problems: Vec<Box<dyn Runner>> = vec![
        Box::new(problems::p001::Problem1),
        Box::new(problems::p005::Problem5),
        Box::new(problems::p007::Problem7),
        Box::new(problems::p010::Problem10),
        Box::new(problems::p012::Problem12),
        // Add new problems to this list
    ];

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
