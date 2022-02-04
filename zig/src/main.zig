const std = @import("std");

const p_0001 = @import("p_0001.zig").main;
const p_0002 = @import("p_0002.zig").main;

pub fn main() anyerror!void {
    try p_0001();
    try p_0002();
}

test "run all tests" {
    _ = @import("p_0001.zig");
    _ = @import("p_0002.zig");
}
