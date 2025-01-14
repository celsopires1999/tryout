const std = @import("std");

pub fn main() !void {
    random1();
}

pub fn random1() void {
    const time: u64 = @intCast(std.time.milliTimestamp());
    std.debug.print("time: {d}\n", .{time});
    var prng = std.rand.DefaultPrng.init(time);
    const random = prng.random().intRangeLessThan(u8, 8, 10);
    std.debug.print("random: {d}\n", .{random});
}
