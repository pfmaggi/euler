const std = @import("std");

fn euler_0010(limit: usize) usize {
    var sieve = std.heap.page_allocator.alloc(bool, limit) catch @panic("Can't allocate memory\n");
    defer std.heap.page_allocator.free(sieve);

    @memset(sieve, true);
    sieve[0] = false;
    sieve[1] = false;

    var sum: usize = 0;
    var i: usize = 2;
    while (i < limit) : (i += 1) {
        if (sieve[i]) {
            sum += i;
            var j: usize = i * i;
            while (j < limit) : (j += i) {
                sieve[j] = false;
            }
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
