const std = @import("std");

// A simple function.
fn add(a: u8, b: u8) u8 {
    return a +| b;
}

// A function that doesn't return a value.
fn printU8(n: u8) void {
    std.debug.print("{}\n", .{n});
}

// A function that never returns.
fn oops() noreturn {
    @panic("Oops!");
}

// If a function is never called, it isn't even evaluated.
fn never() void {
    @compileError("Never happens...");
}

// A `pub` function can be imported from another namespace.
pub fn sub(a: u8, b: u8) u8 {
    return a -| b;
}

// An `extern` function is linked in from an external object file.
extern "c" fn atan2(a: f64, b: f64) f64;

// An `export` function is made available for use in the generated object file.
export fn mul(a: u8, b: u8) u8 {
    return a *| b;
}

// You can force inlining of a function, but usually not necessary.
inline fn answer() u8 {
    return 42;
}

// Zig determines whether to pass parameters by value or by reference.
// Parameters are always constants.

fn addOneNot(n: u8) void {
    n += 1;
}

fn addOne(n: *u8) void {
    n.* += 1;
}

pub fn main() !void {
    const a: u8 = @as(u8, 0xff);
    const b: u8 = 4;
    std.debug.print("{} + {} = {}\n", .{ a, b, add(a, b) });

    printU8(a);

    // oops();

    const c: u8 = 4;
    const d: u8 = 1;
    std.debug.print("{} - {} = {}\n", .{ c, d, sub(c, d) });

    var e: u8 = 2;
    // addOneNot(e);
    addOne(&e);
    std.debug.print("{}\n", .{e});
}
