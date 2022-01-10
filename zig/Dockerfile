FROM --platform=$TARGETPLATFORM ziglang/zig:0.15.2 AS builder
WORKDIR /app
COPY . .
ARG OPT=ReleaseSafe
RUN zig build -Doptimize=$OPT

FROM --platform=$TARGETPLATFORM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/zig-out/bin/zig /demo
EXPOSE 80
ENTRYPOINT ["/demo"]
