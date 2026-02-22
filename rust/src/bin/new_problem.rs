use std::env;
use std::fs::{File, OpenOptions};
use std::io::{Read, Write};
use std::path::Path;

fn main() {
    let args: Vec<String> = env::args().collect();

    // 1. Get Problem ID from arguments
    let id_str = args
        .get(1)
        .expect("Usage: cargo run --bin new_problem <ID>");
    let id: u32 = id_str.parse().expect("Problem ID must be a number");

    // Format with leading zeros for the filename (e.g., p_0001.rs)
    let padded_id = format!("{:0>4}", id);
    let file_path = format!("src/problems/p_{padded_id}.rs");

    // 2. Check if file already exists to prevent overwriting
    if Path::new(&file_path).exists() {
        println!("Error: File {} already exists!", file_path);
        return;
    }

    // 3. Define the Boilerplate Template
    let template = format!(
        r#"use crate::{{Runner, ProblemFactory}};

pub struct Problem{id};

impl Runner for Problem{id} {{
    fn id(&self) -> u32 {{
        {id}
    }}

    fn name(&self) -> &str {{
        "Problem Title Here"
    }}

    fn expected_answer(&self) -> &str {{
        "TODO"
    }}

    fn solve(&self) -> String {{
        // Your logic here
        todo!("Implement solution for problem {id}")
    }}
}}

// Register the problem via the Factory wrapper for inventory
inventory::submit! {{
    ProblemFactory {{ 
        create: || Box::new(Problem{id}) as Box<dyn Runner> 
    }}
}}

#[cfg(test)]
mod tests {{
    use super::*;

    #[test]
    fn test_p_{padded_id}() {{
        let p = Problem{id};
        let expected = p.expected_answer();
        if expected != "TODO" {{
            assert_eq!(p.solve(), expected);
        }}
    }}
}}
"#
    );

    // 4. Create the new problem file
    let mut file = File::create(&file_path).expect("Failed to create problem file");
    file.write_all(template.as_bytes())
        .expect("Failed to write to file");

    // 5. Automatically update src/problems/mod.rs
    update_mod_rs(&padded_id);

    println!(
        "Successfully created {} and updated problems/mod.rs",
        file_path
    );
}

fn update_mod_rs(padded_id: &str) {
    let mod_path = "src/problems/mod.rs";
    let mod_line = format!("pub mod p_{padded_id};");

    // Read existing content to check for duplicates
    let mut content = String::new();
    if let Ok(mut file) = File::open(mod_path) {
        file.read_to_string(&mut content).unwrap();
    }

    if !content.contains(&mod_line) {
        let mut file = OpenOptions::new()
            .append(true)
            .create(true)
            .open(mod_path)
            .expect("Failed to open problems/mod.rs");

        writeln!(file, "{}", mod_line).expect("Failed to append to mod.rs");
    }
}
