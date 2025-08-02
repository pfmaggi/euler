// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.

const std = @import("std");
const fmt = std.fmt;

const IntPair = struct { first: usize, second: usize };

fn is_number_palindrome(number: usize) bool {
    var buf: [128]u8 = undefined;

    const value = fmt.bufPrint(&buf, "{}", .{number}) catch unreachable;

    const len: usize = value.len - 1;
    for (value, 0..) |c, i| {
        if (c != value[len - i]) return false;
    }

    return true;
}

fn euler_0004(digits: usize) IntPair {
    var limit: usize = 1;
    for (0..digits) |_| {
        limit *= 10;
    }

    var result: IntPair = .{ .first = 0, .second = 0 };
    var largest_palindrome: usize = 0;
    var value: usize = 0;
    for ((limit / 10)..limit) |i| {
        for (i..limit) |j| {
            value = i * j;
            if (is_number_palindrome(value) and value > largest_palindrome) {
                largest_palindrome = value;
                result = .{ .first = i, .second = j };
            }
        }
    }

    return result;
}

pub fn main() anyerror!void {
    var out = std.fs.File.stdout().writerStreaming(&.{});
    const factors = euler_0004(3);
    const i = factors.first;
    const j = factors.second;
    try out.interface.print("Problem 0004: The largest palindrome made from the product of two 3-digit numbers is: {d} x {d} = {d}\n", .{ i, j, i * j });
}

test "the largest palindrome made from product of 2-digit numbers is 9009" {
    const factors = euler_0004(2);
    const i = factors.first;
    const j = factors.second;
    try std.testing.expect((i * j) == 9009);
}
