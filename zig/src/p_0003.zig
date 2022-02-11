// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?
//

const std = @import("std");

fn largest_factor(value: usize) usize {
    const sqrt = std.math.sqrt;
    var result: usize = 1;
    var temp: u64 = value;
    while (temp % 2 == 0) {
        result = 2;
        temp /= 2;
    }

    var i: usize = 3;
    const limit: usize = @floatToInt(usize, sqrt(@intToFloat(f64, value)));
    while (i < limit + 1) {
        while (temp % i == 0) {
            result = i;
            temp /= i;
        }
        i += 2;
    }

    if (temp > 2) {
        result = temp;
    }

    return result;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Problem 0003: The largest prime factor of the number 600851475143 is: {d}\n", .{largest_factor(600851475143)});
}

test "the largest prime factor of 13195 is 29" {
    try std.testing.expect(largest_factor(13195) == 29);
}
