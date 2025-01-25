const std = @import("std");

fn is_prime(comptime T: type, n: T) bool {
    if (n <= 1) {
        return false;
    }
    if (n <= 3) {
        return true;
    }
    if ((n % 2 == 0) or (n % 3 == 0)) {
        return false;
    }

    var i: T = 5;
    while (i * i <= n) {
        if ((n % i == 0) or (n % (i + 2) == 0)) {
            return false;
        }
        i += 6;
    }

    return true;
}

fn euler_0010(limit: usize) usize {
    var sum: usize = 0;

    for (2..limit) |i| {
        if (is_prime(usize, i)) {
            sum += i;
        }
    }
    return sum;
}

test "checkSumOfPrimes" {
    try std.testing.expectEqual(17, euler_0010(10));
}

pub fn main() !void {
    std.debug.print("Problem 0010: The sum of all the primes below 2 millions is: {d}\n", .{euler_0010(2_000_000)});
}
