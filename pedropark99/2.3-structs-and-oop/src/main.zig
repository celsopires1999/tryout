const std = @import("std");
const stdout = std.io.getStdOut().writer();
const m = std.math;

const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,

    pub fn init(
        id: u64,
        name: []const u8,
        email: []const u8,
    ) User {
        return User{ .id = id, .name = name, .email = email };
    }

    pub fn print_name(self: User) !void {
        try stdout.print("{s}\n", .{self.name});
    }
};

const Vec3 = struct {
    x: f64,
    y: f64,
    z: f64,

    pub fn distance(self: Vec3, other: Vec3) f64 {
        const xd = m.pow(f64, self.x - other.x, 2.0);
        const yd = m.pow(f64, self.y - other.y, 2.0);
        const zd = m.pow(f64, self.z - other.z, 2.0);
        return m.sqrt(xd + yd + zd);
    }

    pub fn twice(self: *Vec3) void {
        self.x *= 2.0;
        self.y *= 2.0;
        self.z *= 2.0;
    }
};

pub fn main() !void {
    const john = User.init(1, "John Doe", "john.doe@userland.com");
    try john.print_name();

    const mary = User{ .id = 1, .name = "Mary Doe", .email = "mary.doe@userland.com" };

    try mary.print_name();

    const v1 = Vec3{ .x = 4.2, .y = 2.4, .z = 0.9 };

    var v2 = Vec3{ .x = 5.1, .y = 5.6, .z = 1.6 };
    std.debug.print("Distance: {d}\n", .{v1.distance(v2)});

    v2.twice();
    std.debug.print("Distance: {d}\n", .{v1.distance(v2)});
}
