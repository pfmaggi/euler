// Work out the first ten digits of the sum of the following one-hundred 500-digit numbers.

const std = @import("std");

fn compute_len(number: usize, array: []usize) usize {
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

fn euler_0014(comptime limit: usize) usize {
    var array: [limit + 1]usize = std.mem.zeroes([limit + 1]usize);

    var max: usize = 0;
    var result: usize = 1;
    for (1..limit) |n| {
        const count = compute_len(n, &array);
        array[n] = count;
        if (count > max) {
            max = count;
            result = n;
        }
    }
    return result;
}

test "euler14" {
    try std.testing.expectEqual(9, euler_0014(13));
}

pub fn main() !void {
    const result = euler_0014(1000000);
    std.debug.print("Problem 0014: The starting number, under one million, that produces the longest chain is: {d}\n", .{result});
}
