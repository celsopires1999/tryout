const std = @import("std");

pub fn main() void {
    const constant: i32 = 5;
    var variable: u32 = 5000;

    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);

    variable = 500;
    inferred_variable = 500;

    std.debug.print("constant: {}\n", .{constant});
    std.debug.print("variable: {}\n", .{variable});
    std.debug.print("inferred_constant: {}\n", .{inferred_constant});
    std.debug.print("inferred_variable: {}\n", .{inferred_variable});
}
