const std = @import("std");

pub fn main() anyerror!void {
    // Note that info level log messages are by default printed only in Debug
    // and ReleaseSafe build modes.
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    defer {
        _ = gpa.deinit();
    }
    var file = try std.fs.openFileAbsolute("C:\\Users\\JoshPC\\projects\\Random_Projects\\hack\\hello.hack", .{});
    defer file.close();

    var file_buf: [1024]u8 = .{0} ** 1024;
    _ = try file.readAll(&file_buf);
    std.debug.print("All your codebase are belong to us. {s}", .{&file_buf});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
