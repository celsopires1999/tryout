const std = @import("std");

pub fn main() !void {
    var array = [_]u8{ 0, 1, 2, 3, 4, 5 };

    // You can iterate over an array.
    for (array) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n", .{});

    // or a slice
    for (array[0..3]) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n", .{});

    // Add a range to have an index.
    for (array, 0..) |item, i| std.debug.print("{}: {} ", .{ i, item });
    std.debug.print("\n", .{});

    // You can iterte over multiple objects
    // but they all must be of equal length.
    for (array[0..2], array[1..3], array[2..4]) |a, b, c| {
        std.debug.print("{}-{}-{} ", .{ a, b, c });
    }
    std.debug.print("\n", .{});

    // Iterate over a range but it cannot be unbounded.
    for (3..10) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n", .{});

    // break and continue
    var sum: usize = 0;
    for (array) |item| {
        if (item == 3) continue;
        if (item == 4) break;
        sum += item;
    }
    std.debug.print("sum: {}\n", .{sum});

    // Use a label to break or continue from a nested loop.
    sum = 0;
    outer: for (0..10) |oi| {
        for (1..3) |ii| {
            if (oi == 5) break :outer;
            sum += ii;
        }
    }
    std.debug.print("sum: {}\n", .{sum});

    // You can obtain a pointer to the item to modify it.
    // The object must not be const and you must use a pointer to it.
    // (Remember a slice is also a pointer type.)
    for (&array) |*item| {
        item.* *= 2;
        std.debug.print("{} ", .{item.*});
    }
    std.debug.print("\n", .{});

    var maybe_nums = [_]?u8{ 0, 1, 2, null, null, 5 };
    const just_nums = for (maybe_nums, 0..) |opt_num, i| {
        if (opt_num == null) break maybe_nums[0..i];
    } else maybe_nums[0..];

    std.debug.print("just nums: {any}\n", .{just_nums});
}
