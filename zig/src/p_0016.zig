const std = @import("std");

// Function to compute the sum of the digits of 2^1000
fn euler_0016(comptime exponent: usize) usize {
    // Initialize an array to store the digits of 2^exponent
    var digits: [exponent]u8 = std.mem.zeroes([exponent]u8);
    digits[0] = 1; // Start with 2^0 = 1

    var carry: u8 = 0;
    var length: usize = 1; // Current number of digits

    // Multiply by 2 repeatedly to compute 2^exponent
    for (0..exponent) |_| {
        carry = 0;
        for (0..length) |i| {
            const product = digits[i] * 2 + carry;
            digits[i] = @as(u8, product % 10);
            carry = @as(u8, product / 10);
        }

        // If there's a carry after the last digit, increase the length
        while (carry > 0) {
            digits[length] = @as(u8, carry % 10);
            carry /= 10;
            length += 1;
        }
    }

    // Sum the digits
    var sum: usize = 0;
    for (digits[0..length]) |digit| {
        sum += digit;
    }

    return sum;
}

test "euler16" {
    try std.testing.expectEqual(26, euler_0016(15));
}

pub fn main() !void {
    std.debug.print("Problem 0016: The sum of the digits of 2^1000 is: {d}\n", .{euler_0016(1000)});
}
