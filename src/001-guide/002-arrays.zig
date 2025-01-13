const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const hello = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const world = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    print("{c}\n", .{hello[0]});
    print("{c}\n", .{world[0]});

    for (hello) |char| {
        print("{c}", .{char});
    }

    print("\n", .{});

    for (world) |char| {
        print("{c}", .{char});
    }

    print("\n", .{});

    print("the hello array has {d} elements\n", .{hello.len});
}
