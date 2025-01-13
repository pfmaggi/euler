// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

const std = @import("std");

fn computeFactors(num: u32, allocator: std.mem.Allocator) !std.AutoHashMap(u32, u32) {
    var remainder = num;
    var factors = std.AutoHashMap(u32, u32).init(allocator);

    var i: u32 = 2;
    while (i <= num) : (i += 1) {
        while (remainder % i == 0) {
            remainder = remainder / i;
            const gop = try factors.getOrPut(i);
            if (gop.found_existing) {
                gop.value_ptr.* += 1;
            } else {
                gop.value_ptr.* = 1;
            }
        }
    }
    return factors;
}

fn commonFactors(limit: u32, allocator: std.mem.Allocator) !u32 {
    var factors = std.AutoHashMap(u32, u32).init(allocator);
    defer factors.deinit();

    var i: u32 = 2;
    while (i <= limit) : (i += 1) {
        var num_factors = try computeFactors(i, allocator);
        defer num_factors.deinit(); // Deallocate num_factors after each iteration
        var iterator = num_factors.iterator();
        while (iterator.next()) |entry| {
            const gop = try factors.getOrPut(entry.key_ptr.*);
            if (gop.found_existing) {
                if (gop.value_ptr.* < entry.value_ptr.*) {
                    gop.value_ptr.* = entry.value_ptr.*;
                }
            } else {
                gop.value_ptr.* = entry.value_ptr.*;
            }
        }
    }

    var iterator = factors.iterator();
    var result: u32 = 1;
    while (iterator.next()) |entry| {
        result *= std.math.pow(u32, entry.key_ptr.*, entry.value_ptr.*);
    }

    return result;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{}\n", .{try commonFactors(20, allocator)});
}

test "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const result: u32 = try commonFactors(10, allocator);
    try std.testing.expect(result == 2520);
}
