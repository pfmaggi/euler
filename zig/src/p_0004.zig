// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.

const std = @import("std");
const fmt = std.fmt;

fn is_number_palindrome(number: usize) bool {
    var buf: [128]u8 = undefined;

    const value = fmt.bufPrint(&buf, "{}", .{number}) catch unreachable;

    const len: usize = value.len - 1;
    for (value, 0..) |c, i| {
        if (c != value[len - i]) return false;
    }

    return true;
}

fn find_palindrome(digits: usize) usize {
    var limit: usize = 1;
    var i: usize = 0;
    while (i < digits) {
        i += 1;
        limit *= 10;
    }

    var result: usize = 0;
    var a: usize = limit;
    var value: usize = 0;
    while (a > 0) {
        a -= 1;
        var b: usize = limit;
        while (b > 0) {
            b -= 1;
            value = a * b;
            if (is_number_palindrome(value) and value > result) {
                result = value;
                if (b > a) return result;
            }
        }
    }

    return result;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Problem 0004: The largest palindrome made from the product of two 3-digit numbers is: {d}\n", .{find_palindrome(3)});
}

test "the largest palindrome made from product of 2-digit numbers is 9009" {
    try std.testing.expect(find_palindrome(2) == 9009);
}
