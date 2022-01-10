# demo

這是一個可用 build tag 切換框架的簡單 HTTP demo。未指定 tag 時預設使用 `net/http`。

支援的 tag：

- gin
- echo
- httprouter
- iris
- beego
- goframe
- fiber
- chi

注意：一次只能選一個 tag 來 build。

## Build binary

預設（`net/http`）：

```bash
make build
```

指定框架：

```bash
make build-gin
make build-echo
make build-httprouter
make build-iris
make build-beego
make build-goframe
make build-fiber
make build-chi
```

或使用 `TAG` 變數：

```bash
make build TAG=gin
```

如需控制連結參數（例如縮小 binary）：

```bash
make build LDFLAGS="-s -w"
```

一次 build 全部版本：

```bash
make build-all
```

輸出位置預設為 `bin/`，例如 `bin/demo` 或 `bin/demo-gin`。

## Build Docker image

預設（`net/http`）：

```bash
make docker-build
```

指定框架：

```bash
make docker-build-gin
make docker-build-echo
make docker-build-httprouter
make docker-build-iris
make docker-build-beego
make docker-build-goframe
make docker-build-fiber
make docker-build-chi
```

或使用 `TAG` 變數：

```bash
make docker-build TAG=gin
```

自訂 image name：

```bash
IMAGE=my-demo make docker-build-gin
```

## Run

**Binary：**

```bash
./bin/demo -a "Hello, World!"
./bin/demo -a "Hello, World!" -p 8080
./bin/demo-gin -a "Hello, World!"
./bin/demo-gin -a "Hello, World!" -p 8080
```

**Docker：**

```bash
docker run --rm -p 80:80 demo:latest -a "Hello, World!"
docker run --rm -p 80:80 demo:gin -a "Hello, World!"
docker run --rm -p 8080:8080 demo:latest -a "Hello, World!" -p 8080
docker run --rm -p 8080:8080 demo:gin -a "Hello, World!" -p 8080
```
