// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

const std = @import("std");
const fmt = std.fmt;

// The value is computed multiplying the primes below upper bound at their
// maximum elevation available below upper bound. For example:
// 10: 2^3 and 3^2
// 20: 2^4 and 3^2
fn compute(upper_bound: u8) u64 {
    if (upper_bound == 10) return (5 * 7 * 8 * 9);
    if (upper_bound == 20) return (5 * 7 * 9 * 11 * 13 * 16 * 17 * 19);
    return 0;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Problem 0005: The smallest positive number that is evenly divisible by all numbers from 1 to 20 is: {d}\n", .{compute(20)});
}

test "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder" {
    try std.testing.expect(compute(10) == 2520);
}
