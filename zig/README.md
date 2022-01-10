# demo (zig)

Simple HTTP demo using Zig std.http.

## Build binary

```bash
make build
```

Customize optimization mode:

```bash
make build OPT=ReleaseFast
```

The output binary is `bin/demo` by default. You can override the name:

```bash
make build APP=my-demo
```

## Build Docker image

```bash
make docker-build
```

Customize image name or tag:

```bash
IMAGE=my-demo make docker-build
TAG=dev make docker-build
```

## Run

**Binary:**

```bash
./bin/demo -a "Hello, World!"
./bin/demo -a "Hello, World!" -p 8080
```

**Docker:**

```bash
docker run --rm -p 80:80 demo:latest -a "Hello, World!"
docker run --rm -p 8080:8080 demo:latest -a "Hello, World!" -p 8080
```
