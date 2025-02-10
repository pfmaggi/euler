const std = @import("std");

fn euler_0015(comptime size: i8) usize {
    var grid: [size + 1][size + 1]usize = undefined;

    // Initialize the top row and the left column
    for (0..(size + 1)) |i| {
        grid[i][0] = 1;
        grid[0][i] = 1;
    }

    // Fill the grid
    for (1..(size + 1)) |i| {
        for (1..(size + 1)) |j| {
            grid[i][j] = grid[i - 1][j] + grid[i][j - 1];
        }
    }
    return grid[size][size];
}

test "euler15" {
    try std.testing.expectEqual(6, euler_0015(2));
}

pub fn main() !void {
    std.debug.print("Problem 0015: In a 20 x 20 grid the number of available routes are: {d}\n", .{euler_0015(20)});
}
