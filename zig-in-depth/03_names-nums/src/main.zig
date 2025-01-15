const std = @import("std");

// Constant and variable names are snake_case.

// Global constant
const global_const: u8 = 42;

// Global variable
var global_var: u8 = 0;

// Function names are camelCase.
fn printInfo(name: []const u8, x: anytype) void {
    std.debug.print("{s:>10} {any:^10}\t{}\n", .{ name, x, @TypeOf(x) });
}

pub fn main() !void {
    // Some output labeling.
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "name", "value", "type" });
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "----", "-----", "----" });

    // `const` defines an immutable value accessed via the name `a_const`.
    const a_const = 1;
    // a_const += 1;
    printInfo("a_const", a_const);

    // `var` defines a mutable value accessed via the name `a_var`.
    var a_var: u8 = 2;
    a_var += 1;
    printInfo("a_var", a_var);

    // `var` must have a type or be comptime.
    // var b_var = 3;
    // comptime var b_var = 3;
    var b_var: u8 = 3;
    b_var += 1;
    printInfo("b_var", b_var);

    // Both have to be initialized with a value.
    // const b_const;
    // var c_var: u8;

    // Use `undefined` to initialize a variable whose value is
    // to be determined later on in the program.
    var d_var: u8 = undefined;
    printInfo("d_var", d_var); // This prints a garbage value.
    d_var = 3;
    printInfo("d_var", d_var);

    // You can't define a name and not use it.
    var e_var: u8 = 0;
    e_var += 1;
    // As a workaround, you can use the underscore special name to ignore something.
    // In version 0.13 it does not work any longer.
    // _ = e_var;

    // Integers
    // Unsigned u8, u16, u32, u64, u128, usize (u{0-65535}).
    // Signed i8, i16, i32, i64, i128, isize (i{0-65535}).
    // Literals can be decimal, binary, hex, and octal.
    // Optional underscores for readability.
    _ = 1_000_000; // decimal
    _ = 0x10ff_ffff; // hex
    _ = 0o777; // octal
    _ = 0b1111_0101_0111; // binary
    // You can have arbitrary size.
    var f_var: u1 = 0;
    f_var = 1;
    // f_var = 2; // Value out of range for type.
    const g_const: u21 = '🦎';
    _ = g_const;

    // comptime_int is the type of integer literals.
    const h_const = 42;
    printInfo("h_const", h_const);

    // Floating Point
    // f16, f32, f64, f80, f128
    // Literals can be decimal or, hex.
    _ = 123.0E+77; // With exponent
    _ = 123.0; // Without exponent
    _ = 123.0e+77; // E or e for exponent

    _ = 0x103.70; // hex floating point
    _ = 0x103.70p-5; // P or p for hex exponent
    _ = 0x103.70P-5;

    // Optional underscores for readability.
    _ = 299_792_458.000_000;
    _ = 0.000_000_001;
    _ = 0x1234_5678.9ABC_CDEFp-10;

    // Infinities and NaN
    _ = std.math.inf(f64); // Positive infinity
    _ = -std.math.inf(f64); // Negative infinity
    _ = std.math.nan(f64); // Not a Number

    // comptime_float is the type of float literals.
    const i_const = 3.1415;
    printInfo("i_const", i_const);
}
