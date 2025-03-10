// Each new term in the Fibonacci sequence is generated by adding the previous
// two terms. By starting with 1 and 2, the first 10 terms will be:
//
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
//
// By considering the terms in the Fibonacci sequence whose values do not
// exceed four million, find the sum of the even-valued terms.

const std = @import("std");

fn compute(limit: usize) usize {
    var a: usize = 1;
    var b: usize = 2;
    var sum: usize = 0;
    while (b < limit) {
        if (b % 2 == 0) sum += b;
        const c: usize = a;
        a = b;
        b += c;
    }
    return sum;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Problem 0002: Sum of even-valued fibonacci terms below 4000000 is: {d}\n", .{compute(4000000)});
}

test "sum of multiple below 100 is 44" {
    try std.testing.expect(compute(100) == 44);
}
