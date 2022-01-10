const std = @import("std");
const zig = @import("zig");

const Args = struct {
    message: []const u8,
    port: u16,
};

const usage =
    \\Usage: zig [options]
    \\  -a <message>   Specify return string (default: "Hello, World!")
    \\  -p <port>      Specify listen port (default: 80)
    \\  -h, --help     Show this help
    \\
;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = parseArgs(allocator) catch |err| {
        std.debug.print("{s}", .{usage});
        if (err == error.ShowUsage) return;
        return err;
    };

    try zig.http.runServer(args.message, args.port);
}

fn parseArgs(allocator: std.mem.Allocator) !Args {
    const argv = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, argv);

    var message: []const u8 = "Hello, World!";
    var message_from_args = false;
    var port: u16 = 80;

    var i: usize = 1;
    while (i < argv.len) : (i += 1) {
        const arg = argv[i];
        if (std.mem.eql(u8, arg, "-a")) {
            i += 1;
            if (i >= argv.len) return error.MissingValue;
            message = argv[i];
            message_from_args = true;
        } else if (std.mem.eql(u8, arg, "-p")) {
            i += 1;
            if (i >= argv.len) return error.MissingValue;
            port = std.fmt.parseInt(u16, argv[i], 10) catch return error.InvalidPort;
        } else if (std.mem.eql(u8, arg, "-h") or std.mem.eql(u8, arg, "--help")) {
            return error.ShowUsage;
        } else {
            return error.InvalidArgument;
        }
    }

    if (message_from_args) {
        message = try allocator.dupe(u8, message);
    }

    return .{
        .message = message,
        .port = port,
    };
}

test "simple test" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(gpa); // Try commenting this out and see if zig detects the memory leak!
    try list.append(gpa, 42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test "fuzz example" {
    const Context = struct {
        fn testOne(context: @This(), input: []const u8) anyerror!void {
            _ = context;
            // Try passing `--fuzz` to `zig build test` and see if it manages to fail this test case!
            try std.testing.expect(!std.mem.eql(u8, "canyoufindme", input));
        }
    };
    try std.testing.fuzz(Context{}, Context.testOne, .{});
}
