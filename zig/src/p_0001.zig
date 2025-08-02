// If we list all the natural numbers below 10 that are multiples of 3 or 5,
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
//Find the sum of all the multiples of 3 or 5 below 1000.
//

const std = @import("std");

fn compute(comptime limit: usize) usize {
    var sum: usize = 0;
    for (3..limit) |i| {
        if ((i % 3 == 0) or (i % 5 == 0)) sum += i;
    }
    return sum;
}

pub fn main() anyerror!void {
    var out = std.fs.File.stdout().writerStreaming(&.{});

    try out.interface.print("Problem 0001: Sum of multiples of 3 and 5 below 1000 is: {d}\n", .{comptime compute(1000)});
}

test "sum of multiple below 10 is 23" {
    try comptime std.testing.expect(compute(10) == 23);
}
