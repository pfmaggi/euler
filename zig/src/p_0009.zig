// Find the thirteen adjacent digits in the 1000-digit number that have the
// greatest product. What is the value of this product?

const std = @import("std");

fn isPythagoreanTriplet(a: usize, b: usize) ?usize {
    if (!(a < b)) return null;
    const c2: usize = a * a + b * b;
    const c: usize = @intFromFloat(@sqrt(@as(f64, @floatFromInt(c2))));
    if (c2 == c * c) return c;
    return null;
}

fn euler_0009(sum: usize) ?[3]usize {
    for (1..(sum / 2)) |a| {
        for ((a + 1)..(sum / 2)) |b| {
            if (isPythagoreanTriplet(a, b)) |c| {
                if (a + b + c == sum) {
                    return [_]usize{ a, b, c };
                }
            }
        }
    }
    return null;
}

test "checkPythagoreanTriplet" {
    if (isPythagoreanTriplet(3, 4)) |c| {
        try std.testing.expectEqual(5, c);
    } else {
        @panic("No Pythagorean triplet found.\n");
    }
}

pub fn main() !void {
    if (euler_0009(1000)) |triplet| {
        std.debug.print("Problem 0009: The product of the Pythagorean triplet ({d}, {d}, {d}) is: {d}\n", .{ triplet[0], triplet[1], triplet[2], triplet[0] * triplet[1] * triplet[2] });
    } else {
        std.debug.print("No Pythagorean triplet found.\n", .{});
    }
}
