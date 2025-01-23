const std = @import("std");

const Suit = enum {
    Clubs,
    Diamonds,
    Hearts,
    Spades,
};

const Face = enum(u8) {
    Ace = 1,
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Jack,
    Queen,
    King,
};

const Card = struct {
    face: Face,
    suit: Suit,

    pub fn format(self: Card, comptime _: []const u8, _: std.fmt.FormatOptions, writer: anytype) !void {
        _ = try writer.print("{s} of {s} with value {}", .{
            @tagName(self.face),
            @tagName(self.suit),
            @intFromEnum(self.face),
        });
    }
};

pub fn main() void {
    const aos = Card{ .face = .Ace, .suit = .Spades };
    std.debug.print("{}\n", .{aos});

    const qoh = Card{ .face = .Queen, .suit = .Hearts };
    std.debug.print("{}\n", .{qoh});
}
