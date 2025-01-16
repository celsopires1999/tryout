const std = @import("std");

pub fn main() !void {
    const zero: u8 = 0;
    const one: u8 = 1;
    const two: u8 = 2;
    const two_fifty: u8 = 250;

    var result = zero + two - one * two / one % 2;
    std.debug.print("result: {}\n", .{result});

    result = two_fifty + 2;
    std.debug.print("result: {}\n", .{result});

    result = two_fifty *% 2;
    std.debug.print("*% result: {}\n", .{result});

    result = two_fifty *| 2;
    std.debug.print("*| result: {}\n", .{result});

    result = zero -% 1;
    std.debug.print("-% result: {}\n", .{result});

    result = zero -| 1;
    std.debug.print("-| result: {}\n", .{result});

    const neg_one_twenty_eigth: i8 = -128;
    std.debug.print("-% 128 i8 result {}\n", .{-%neg_one_twenty_eigth});

    std.debug.print("1 << 2: {}\n", .{1 << 2});
    std.debug.print("1 <<| 2: {}\n", .{1 <<| 2});
    std.debug.print("32 >> 1: {}\n", .{32 >> 1});

    std.debug.print("32 | 2: {}\n", .{32 | 2});
    std.debug.print("32 & 1: {}\n", .{32 & 1});
    std.debug.print("32 ^ 0: {}\n", .{32 ^ 32});

    var one_bit: u8 = 0b0000_0001;
    std.debug.print("one_bit: {}\n", .{one_bit});

    one_bit = ~one_bit;
    std.debug.print("~one_bit: {}\n", .{one_bit});

    std.debug.print("comparison: 3 < 9? {}\n", .{3 < 9});
    std.debug.print("comparison: 3 <= 9? {}\n", .{3 <= 9});
    std.debug.print("comparison: 3 > 9? {}\n", .{3 > 9});
    std.debug.print("comparison: 3 >= 9? {}\n", .{3 >= 9});
    std.debug.print("comparison: 3 == 9? {}\n", .{3 == 9});
    std.debug.print("comparison: 3 != 9? {}\n", .{3 != 9});

    // Types coerce when it is safe
    const byte: u8 = 255;
    const word: u16 = 65_280;
    const dword: u32 = byte + word;
    std.debug.print("dword: {}\n", .{dword});
    // Otherwise you have to cast.
    const word_2: u16 = @intCast(dword);
    std.debug.print("word_2: {}\n", .{word_2});

    // Conversions
    var a_float: f32 = 3.1415;
    const an_int: i32 = @intFromFloat(a_float);
    std.debug.print("an_int: {}\n", .{an_int});
    a_float = @floatFromInt(an_int);
    std.debug.print("a_float: {}\n", .{a_float});

    const byte_1: u8 = 255;
    const byte_2: u8 = 33;

    const byte_res = @addWithOverflow(byte_1, byte_2);
    std.debug.print("byte_res: {}", .{byte_res});

    // Numeric op builtins
    // @addWithOverflow, @mulWithOverflow, @mod, @rem, @fabs, @sqrt, @min, @max, etc...

    // std.math Numeric ops too
    // std.math.add, std.math.sub, std.math.divExact, etc...

}
