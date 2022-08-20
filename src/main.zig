const std = @import("std");

pub fn decode_instruction(instruction_string: []const u8) u16 {
    var instr: u16 = 0;
    var i: usize = 0;
    while (i < 16) : (i += 1) {
        if (instruction_string[i] == '1') {
            instr |= (@intCast(u16, 1) << (15 - @intCast(u4, i)));
        }
    }
    return instr;
}

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

test "parse instruction" {
    try std.testing.expectEqual(decode_instruction("0101010101010101"), @intCast(u16, 0b0101_0101_0101_0101));
}
