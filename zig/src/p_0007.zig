const std = @import("std");

fn findNthPrime(n: usize) usize {
    var count: usize = 0;
    var num: usize = 2;
    while (count < n) {
        if (isPrime(num)) {
            count += 1;
        }
        num += 1;
    }
    return num - 1;
}

fn isPrime(number: usize) bool {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 or number % 3 == 0) return false;
    var i: usize = 5;
    while (i * i <= number) {
        if (number % i == 0 or number % (i + 2) == 0) return false;
        i += 6;
    }
    return true;
}

test "findNthPrime" {
    try std.testing.expectEqual(@as(usize, 13), findNthPrime(6));
}

pub fn main() anyerror!void {
    const prime = findNthPrime(10001);
    std.debug.print("Problem 0007: The 10001st prime number is: {}\n", .{prime});
}
