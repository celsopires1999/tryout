const std = @import("std");
const expect = std.testing.expect;

// pub fn main() !void {

// }

test "test 1" {
    const x: u8 = 5;
    // std.debug.print("type of x: {}\n", .{@TypeOf(x)});
    const y = @as(u32, x);
    try expect(@TypeOf(y) == u32);
    // std.debug.print("type of y: {}\n", .{@TypeOf(y)});
}

test "test 2" {
    const x: u32 = 565;
    const y: f32 = @floatFromInt(x);
    try expect(@TypeOf(y) == f32);
    // std.debug.print("value of y: {}, type of y: {}\n", .{ y, @TypeOf(y) });
}

test "test 3" {
    const bytes align(@alignOf(u32)) = [_]u8{ 0x12, 0x12, 0x12, 0x12 };

    const u32_ptr: *const u32 = @ptrCast(&bytes);
    try expect(@TypeOf(u32_ptr) == *const u32);
}
