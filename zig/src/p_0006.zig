// Find the difference between the sum of the squares of the first one hundred
// natural numbers and the square of the sum.

const std = @import("std");
const fmt = std.fmt;

fn sum_of_squares(upper_bound: u16) u64 {
    var total: u64 = 1;
    for (2..upper_bound + 1) |num| {
        total = total + (num * num);
    }

    return total;
}

fn square_of_sum(upper_bound: u16) u64 {
    var total: u64 = 1;
    for (2..upper_bound + 1) |num| {
        total += num;
    }
    return (total * total);
}

pub fn main() anyerror!void {
    var out = std.fs.File.stdout().writerStreaming(&.{});

    try out.interface.print("Problem 0006: Difference between the squares of sums and the sum of square: {d}\n", .{square_of_sum(100) - sum_of_squares(100)});
}

test "2640 is the difference between the square of sums and the sum of squares for the first 10 numbers" {
    try std.testing.expect(square_of_sum(10) == 3025);
    try std.testing.expect(sum_of_squares(10) == 385);
    try std.testing.expect(square_of_sum(10) - sum_of_squares(10) == 2640);
}
