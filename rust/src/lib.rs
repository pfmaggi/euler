pub trait Runner {
    fn id(&self) -> u32;
    fn name(&self) -> &str;
    fn solve(&self) -> String; // Use String to handle different return types
}

pub mod problems;
