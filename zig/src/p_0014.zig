// Work out the first ten digits of the sum of the following one-hundred 500-digit numbers.

const std = @import("std");

var array: [1000000]usize = std.mem.zeroes([1000000]usize);

fn euler_0014(number: usize) usize {
    var value = number;
    var count: usize = 1;
    while (value > 1) {
        if (value < number) {
            // if we have already seen this number we can
            // evaluate the final count for `number`
            return count + array[value] - 1;
        }
        count += 1;
        if (value % 2 == 0) {
            // Current value is even
            // value = value / 2
            value /= 2;
        } else {
            // Current value is odd
            // 3n + 1
            value = (3 * value) + 1;
        }
    }
    return count;
}

// The sequence generated starting from the number 13 has 10 elements:
// 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
test "euler14" {
    for (1..13) |n| {
        const count = euler_0014(n);
        array[n] = count;
    }
    try std.testing.expectEqual(10, euler_0014(13));
}

pub fn main() !void {
    var max: usize = 0;
    var result: usize = 1;
    for (1..1000000) |n| {
        const count = euler_0014(n);
        array[n] = count;
        if (count > max) {
            max = count;
            result = n;
        }
    }
    // Print the first ten digits
    std.debug.print("Problem 0014: The starting number, under one million, that produces the longest chain is: {d}\n", .{result});
}
