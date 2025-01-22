const std = @import("std");

pub fn main() !void {

    // A block can defined a new scope.
    {
        const x: u8 = 42;
        std.debug.print("x: {}\n", .{x});
    }

    // x is no longer in scope out here.
    // std.debug.print("x: {}\n", .{x});

    // Blocks are expressions and can return a value
    // using a label and `break`.
    const x: u8 = blk: {
        const z = 42;
        const y: u8 = 13;
        break :blk y + z;
    };
    std.debug.print("x: {}\n", .{x});

    // `switch` controls execution flow based on a value.
    switch (x) {
        // Range inclusive on both ends.
        0...33 => std.debug.print("It's 0 to 33.\n", .{}),
        34...39 => std.debug.print("It's 34 to 39.\n", .{}),

        // You can combine several values to test with commas.
        // This is like the fallthrough behaviour in other languages.
        40, 41, 42 => std.debug.print("It's 40, 41, or 42", .{}),

        // You can capture the matched value.
        43...60 => |n| std.debug.print("It's {}.\n", .{n}),

        // Use a block for more complex prongs.
        77 => {
            const a = 1;
            const b = 2;
            std.debug.print("a + b == {}\n", .{a + b});
        },

        // As long as it's comptime known, any expression can be a prong.
        blk: {
            const a = 100;
            const b = 2;
            break :blk a + b;
        } => std.debug.print("It's 102.\n", .{}),

        99...101 => |n| {
            std.debug.print("It's {}.\n", .{n});
        },

        // `else` is the default if no other prong matches.
        // Mandatory if non-exhaustive switch.
        else => std.debug.print("None of the above!\n", .{}),
    }
}
