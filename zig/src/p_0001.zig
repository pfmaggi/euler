// If we list all the natural numbers below 10 that are multiples of 3 or 5,
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
//Find the sum of all the multiples of 3 or 5 below 1000.
//

const std = @import("std");

fn compute(limit: u64) u64 {
    var i: u64 = 1;
    var sum: u64 = 0;
    while (i < limit) {
        if ((i % 3 == 0) or (i % 5 == 0)) sum += i;
        i += 1;
    }
    return sum;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Problem 0001: Sum of multiples of 3 and 5 below 1000 is: {d}\n", .{compute(1000)});
}

test "sum of multiple below 10 is 23" {
    try std.testing.expect(compute(10) == 23);
}
