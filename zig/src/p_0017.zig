// If the numbers 1 to 5 are written out in words: one, two, three, four, five,
// then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
// If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
// how many letters would be used?
//
// NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
// contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
// The use of "and" when writing out numbers is in compliance with British usage.

const std = @import("std");

// Lengths for 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
// 0 is empty string (e.g. 20 is "twenty" + "")
const ones_lengths = [_]usize{ 0, 3, 3, 5, 4, 4, 3, 5, 5, 4 };

// Lengths for 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
const teens_lengths = [_]usize{ 3, 6, 6, 8, 8, 7, 7, 9, 8, 8 };

// Lengths for 0, 10, 20, 30, 40, 50, 60, 70, 80, 90
// Indices 0 and 1 are placeholders/unused for this logic
const tens_lengths = [_]usize{ 0, 0, 6, 6, 5, 5, 5, 7, 6, 6 };

fn count_letters(n: usize) usize {
    if (n < 10) {
        return ones_lengths[n];
    } else if (n < 20) {
        return teens_lengths[n - 10];
    } else if (n < 100) {
        return tens_lengths[n / 10] + ones_lengths[n % 10];
    } else if (n < 1000) {
        var sum = ones_lengths[n / 100] + 7; // "hundred" is 7
        if (n % 100 != 0) {
            sum += 3; // "and" is 3
            sum += count_letters(n % 100);
        }
        return sum;
    } else if (n == 1000) {
        return 3 + 8; // "one" + "thousand"
    }
    return 0;
}

fn compute(limit: usize) usize {
    var sum: usize = 0;
    for (1..limit + 1) |i| {
        sum += count_letters(i);
    }
    return sum;
}

pub fn main() anyerror!void {
    const answer = compute(1000);
    std.debug.print("Problem 0017: Total number of letters used for numbers from 1 to 1000 is: {d}\n", .{answer});
}

test "342 is 23" {
    // three hundred and forty-two
    // 5 + 7 + 3 + 5 + 3 = 23
    try std.testing.expectEqual(@as(usize, 23), count_letters(342));
}

test "115 is 20" {
    // one hundred and fifteen
    // 3 + 7 + 3 + 7 = 20
    try std.testing.expectEqual(@as(usize, 20), count_letters(115));
}
