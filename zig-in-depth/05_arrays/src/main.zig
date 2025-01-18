const std = @import("std");

pub fn main() !void {
    // Explicit type and length.
    const a1: [5]u8 = [5]u8{ 0, 1, 2, 3, 4 };
    std.debug.print("a1: {any}, a1.len: {}\n", .{ a1, a1.len });

    // Inferred type and length.
    const a2 = [_]u8{ 0, 1, 2, 3, 4 };
    std.debug.print("a2: {any}, a2.len: {}\n", .{ a2, a2.len });

    // ** repeats an array...
    const a3 = a2 ** 2;
    std.debug.print("a3: {any}, a3.len: {}\n", .{ a3, a3.len });

    // ... and can initialize it with a repeated value too.
    const a4 = [_]u8{0} ** 5;
    std.debug.print("a4: {any}, a4.len: {}\n", .{ a4, a4.len });

    // The array length must be comptime known.
    // var x: u8 = 5;
    // const a5: [x]u8 = [_]u8{0} ** x;
    // std.debug.print("a5: {any}, a5.len: {}\n", .{ a5, a5.len });
    // x = 6;

    // You can leave the array as undefined and still use it later.
    var a6: [2]u8 = undefined;
    a6[0] = 1;
    a6[1] = 2;
    std.debug.print("a6: {any}, a6.len: {}\n", .{ a6, a6.len });

    // Multi-dimensional arrays
    const a7: [2][2]u8 = [_][2]u8{
        .{ 1, 2 },
        .{ 3, 4 },
    };
    std.debug.print("a7: {any}, a7.len: {}\n", .{ a7, a7.len });
    std.debug.print("a7[1][0] == {}\n", .{a7[1][0]});

    const a7a: [3][2]u8 = [_][2]u8{
        .{ 1, 2 },
        .{ 3, 4 },
        .{ 5, 6 },
    };
    std.debug.print("a7a: {any}, a7a.len: {}\n", .{ a7a, a7a.len });
    std.debug.print("a7a[1][0] == {}\n", .{a7a[1][0]});

    const a7b: [3][4][2]u8 = [_][4][2]u8{
        .{
            .{ 11, 12 },
            .{ 21, 22 },
            .{ 31, 32 },
            .{ 41, 42 },
        },
        .{
            .{ 51, 52 },
            .{ 61, 62 },
            .{ 71, 72 },
            .{ 81, 82 },
        },
        .{
            .{ 91, 92 },
            .{ 101, 102 },
            .{ 111, 112 },
            .{ 121, 122 },
        },
    };
    std.debug.print("a7b: {any}, a7b.len: {}\n", .{ a7b, a7b.len });
    std.debug.print("a7b[1][0] == {any}\n", .{a7b[1][0]});
    std.debug.print("a7b[1][0][0] == {}\n", .{a7b[1][0][0]});

    // Sentinel terminated arrays use [N:V]T syntax where N is the length
    // and V is the sentinel value of type T.
    const a8: [2:0]u8 = .{ 1, 2 };
    std.debug.print("a8: {any}, a8.len: {}\n", .{ a8, a8.len });

    // In normal arrays, you can't access the index == len.
    // std.debug.print("a7[a7.len][0] == {}\n", .{a7[a7.len][0]});
    // In a sentinel terminated array, you can, and it's the sentinel.
    std.debug.print("a8[a8.len] == {}\n", .{a8[a8.len]});

    // ++ concatenates arrays.
    const a9 = a1 ++ a2;
    std.debug.print("a9: {any}, a9.len: {}\n", .{ a9, a9.len });

    // With ** you can call a function to initialize an array.
    const a10 = [_]u8{getSquare(3)} ** 3;
    std.debug.print("a10: {any}, a10.len: {}\n", .{ a10, a10.len });

    // Empty array.
    const a11 = [0]u8{};
    std.debug.print("a11: {any}, a11.len: {}\n", .{ a11, a11.len });
    const a12 = [_]u8{};
    std.debug.print("a12: {any}, a12.len: {}\n", .{ a12, a12.len });
}

fn getSquare(x: u8) u8 {
    return x *| x;
}
