const std = @import("std");

fn countDivisors(n: u64) u64 {
    var count: u64 = 0;
    var i: u64 = 1;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) {
            if (n / i == i) {
                count += 1;
            } else {
                count += 2;
            }
        }
    }
    return count;
}

fn euler_12(targetDivisors: u64) u64 {
    var triangularNumber: u64 = 0;
    var divisors: u64 = 0;
    var n: u64 = 1;
    while (divisors <= targetDivisors) : (n += 1) {
        triangularNumber += n;
        divisors = countDivisors(triangularNumber);
    }
    return triangularNumber;
}

test "euler12" {
    try std.testing.expectEqual(@as(u64, 28), euler_12(5));
}

pub fn main() !void {
    const result = euler_12(500);
    std.debug.print(
        "Problem 0012: The first triangular number with over 500 divisors is: {}\n",
        .{result},
    );
}
