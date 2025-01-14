const expect = @import("std").testing.expect;
const std = @import("std");

test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    // std.debug.print("value {d}\n", .{i});
    try expect(i == 128);
}
