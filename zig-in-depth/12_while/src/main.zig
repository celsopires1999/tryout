const std = @import("std");
const expect = @import("std").testing.expect;

pub fn main() !void {
    // Basic while
    var i: usize = 0;
    while (i < 3) {
        std.debug.print("{} ", .{i});
        i += 1;
    }
    std.debug.print("\n", .{});

    // Continue expression.
    i = 0;
    while (i < 3) : (i += 1) std.debug.print("{} ", .{i});
    std.debug.print("\n", .{});

    // Complex continue expression.
    i = 0;
    var j: usize = 0;
    while (i < 3) : ({
        i += 1;
        j += 1;
    }) std.debug.print("{}-{} ", .{ i, j });
    std.debug.print("\n", .{});

    // while loop continue expression, more complicated
    i = 1;
    j = 1;
    while (i * j < 2000) : ({
        i *= 2;
        j *= 3;
    }) {
        const my_ij = i * j;
        std.debug.print("{} * {} = {}\n", .{ i, j, my_ij });
    }

    // break and continue, labels too.
    i = 0;
    outer: while (true) : (i += 1) {
        while (i < 10) : (i += 1) {
            if (i == 4) continue :outer;
            if (i == 6) break :outer;
            std.debug.print("{} ", .{i});
        }
    }
    std.debug.print("\n", .{});

    // while loop as expression.

    const start: usize = 1;
    const end: usize = 20;
    i = start;
    const n: usize = 13;
    const in_range = while (i <= end) : (i += 1) {
        if (n == i) break true;
    } else false;
    std.debug.print("{} in {} to {}? {}\n", .{ n, start, end, in_range });

    // while with optional and capture.
    std.debug.print("while with optional and capture: ", .{});
    count_down = 3;
    while (countDownIterator()) |num| std.debug.print("{} ", .{num});
    std.debug.print("\n", .{});
}

var count_down: usize = undefined;

fn countDownIterator() ?usize {
    return if (count_down == 0) null else blk: {
        count_down -= 1;
        break :blk count_down;
    };
}
