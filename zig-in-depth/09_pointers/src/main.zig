const std = @import("std");

pub fn main() !void {
    // Single item pointer to a constant.
    const a: u8 = 0;
    const a_ptr = &a;
    // a_ptr.* += 1; // cannot assign to constant
    std.debug.print("a_ptr: {}, type of a_ptr: {}\n", .{ a_ptr.*, @TypeOf(a_ptr) });

    // Single item pointer to a variable.
    var b: u8 = 0;
    const b_ptr = &b;
    b_ptr.* += 1; // Ok
    std.debug.print("b_ptr: {}, type of b_ptr: {}\n", .{ b_ptr.*, @TypeOf(b_ptr) });

    // Both are const and can't be modified themselves.
    // a_ptr = &b;
    // b_ptr = &a;

    // Use a var if you need to swap the pointer itself.
    var c_ptr = a_ptr;
    c_ptr = b_ptr; // OK
    std.debug.print("c_ptr: {}, type of c_ptr: {}\n", .{ c_ptr.*, @TypeOf(c_ptr) });

    // Multi-item pointer.
    var array = [_]u8{ 1, 2, 3, 4, 5, 6 };
    var d_ptr: [*]u8 = &array;
    std.debug.print("d_ptr[0]: {}, type of d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    d_ptr[1] += 200; // index op
    std.debug.print("array: {any}\n", .{array});
    d_ptr += 1; // Pointer arithmetic.
    std.debug.print("d_ptr[0]: {}, type of d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    d_ptr -= 1; // Pointer arithmetic.
    std.debug.print("d_ptr[0]: {}, type of d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });

    std.debug.print("\n", .{});

    // Pointer to array.
    const e_ptr = &array;
    std.debug.print("e_ptr[0]: {}, type of e_ptr: {}\n", .{ e_ptr[0], @TypeOf(e_ptr) });
    e_ptr[1] += 1;
    std.debug.print("e_ptr[1]: {}, type of e_ptr: {}\n", .{ e_ptr[1], @TypeOf(e_ptr) });
    std.debug.print("array[1]: {}\n", .{array[1]});
    std.debug.print("e_ptr.len: {}\n", .{e_ptr.len});

    std.debug.print("\n", .{});

    // Sentinel terminated pointer.
    array[3] = 0;
    const f_ptr: [*:0]const u8 = array[0..3 :0];
    std.debug.print("f_ptr[1]: {}, type of f_ptr: {}\n", .{ f_ptr[1], @TypeOf(f_ptr) });
    std.debug.print("array: {any}\n", .{array});

    std.debug.print("\n", .{});

    // If you ever need the address as an integer.
    const address = @intFromPtr(f_ptr);
    std.debug.print("address: {}, type of address: {}\n", .{ address, @TypeOf(address) });

    // and the other way around too.
    const g_ptr: [*:0]const u8 = @ptrFromInt(address);
    std.debug.print("g_ptr[1]: {}, type of g_ptr: {}\n", .{ g_ptr[1], @TypeOf(g_ptr) });

    std.debug.print("\n", .{});

    // If you need a pointer that can be null like in C, use an optional pointer.
    var h_ptr: ?*const usize = null;
    std.debug.print("h_ptr: {?}, type of h_ptr: {}\n", .{ h_ptr, @TypeOf(h_ptr) });
    h_ptr = &address;
    std.debug.print("h_ptr.?.*: {}, type of h_ptr: {}\n", .{ h_ptr.?.*, @TypeOf(h_ptr) });
    // The size of an optional pointer is the same as a normal pointer.
    std.debug.print("h_ptr size: {}, *usize size: {}\n", .{ @sizeOf(@TypeOf(h_ptr)), @sizeOf(*usize) });

    // There's also [*c] but that's only for transitioning from C code.
}
