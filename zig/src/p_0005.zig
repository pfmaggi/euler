// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

const std = @import("std");

// Calculate greates common divisor (GCD)
fn gcd(a: u64, b: u64) u64 {
    if (b == 0) return a;
    return gcd(b, a % b);
}

// Calculate least common multiple (LCM)
fn lcm(a: u64, b: u64) u64 {
    return a * b / gcd(a, b);
}

fn compute(limit: u64) u64 {
    var result: u64 = 1;
    for (1..limit + 1) |i| {
        result = lcm(result, i);
    }
    return result;
}

pub fn main() !void {
    std.debug.print("{}\n", .{compute(20)});
}

test "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder" {
    try std.testing.expect(compute(10) == 2520);
}
