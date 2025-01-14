const std = @import("std");

pub fn main() void {
    var items: [4]u8 = .{ 3, 2, 2, 1 };
    std.sort.block(u8, &items, {}, std.sort.asc(u8));
    std.debug.print("{any}\n", .{items});
}
