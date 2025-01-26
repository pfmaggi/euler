const std = @import("std");

const p_0001 = @import("p_0001.zig").main;
const p_0002 = @import("p_0002.zig").main;
const p_0003 = @import("p_0003.zig").main;
const p_0004 = @import("p_0004.zig").main;
const p_0005 = @import("p_0005.zig").main;
const p_0006 = @import("p_0006.zig").main;
const p_0007 = @import("p_0007.zig").main;
const p_0008 = @import("p_0008.zig").main;
const p_0009 = @import("p_0009.zig").main;
const p_0010 = @import("p_0010.zig").main;
const p_0011 = @import("p_0011.zig").main;

pub fn main() anyerror!void {
    try p_0001();
    try p_0002();
    try p_0003();
    try p_0004();
    try p_0005();
    try p_0006();
    try p_0007();
    try p_0008();
    try p_0009();
    try p_0010();
    try p_0011();
}

test "run all tests" {
    _ = @import("p_0001.zig");
    _ = @import("p_0002.zig");
    _ = @import("p_0003.zig");
    _ = @import("p_0004.zig");
    _ = @import("p_0005.zig");
    _ = @import("p_0006.zig");
    _ = @import("p_0007.zig");
    _ = @import("p_0008.zig");
    _ = @import("p_0009.zig");
    _ = @import("p_0010.zig");
    _ = @import("p_0011.zig");
}
