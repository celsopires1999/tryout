const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const fileName = "day01.txt";
    const file = try std.fs.cwd().openFile(fileName, .{});
    defer file.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();

    const read_buf = try file.readToEndAlloc(allocator, 1024 * 1024);
    defer allocator.free(read_buf);

    // try std.io.getStdOut().writeAll(read_buf);

    var it = std.mem.split(u8, read_buf, "\n");

    var elfArray = std.ArrayList(u32).init(allocator);
    defer elfArray.deinit();

    var elfCarryingAmount: u32 = 0;

    while (it.next()) |amount| {
        if (amount.len > 0) {
            const result: u32 = try std.fmt.parseInt(u32, amount, 10);
            elfCarryingAmount += result;
        } else {
            try elfArray.append(elfCarryingAmount);
            elfCarryingAmount = 0;
        }
    }

    // for (elfArray.items) |item| {
    //     print("item: {}\n", .{item});
    // }

    const max = std.mem.max(u32, elfArray.items);

    print("Max: {}\n", .{max});
}
