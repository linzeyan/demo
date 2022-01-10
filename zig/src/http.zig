const std = @import("std");

pub fn runServer(message: []const u8, port: u16) !void {
    const address = try std.net.Address.parseIp("0.0.0.0", port);
    var server = try address.listen(.{ .reuse_address = true });
    defer server.deinit();

    while (true) {
        var conn = try server.accept();
        defer conn.stream.close();
        handleConnection(conn.stream, message);
    }
}

fn handleConnection(stream: std.net.Stream, message: []const u8) void {
    var read_buffer: [8192]u8 = undefined;
    var write_buffer: [8192]u8 = undefined;

    var reader = stream.reader(&read_buffer);
    var writer = stream.writer(&write_buffer);

    var http_server = std.http.Server.init(reader.interface(), &writer.interface);

    while (true) {
        var request = http_server.receiveHead() catch return;

        const headers = [_]std.http.Header{
            .{ .name = "content-type", .value = "text/plain" },
        };

        request.respond(message, .{
            .status = .ok,
            .keep_alive = request.head.keep_alive,
            .extra_headers = &headers,
        }) catch return;

        if (!request.head.keep_alive) return;
    }
}
