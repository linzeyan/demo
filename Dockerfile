FROM golang:1.17-alpine3.14 AS builder
RUN apk add build-base upx
WORKDIR /app
COPY . .
RUN go build -trimpath -mod vendor -o go-demo ./main.go
RUN upx -9 -o demo go-demo

FROM alpine
ENV TZ=Asia/Taipei
RUN apk add tzdata --no-cache
COPY --from=builder /app/demo /usr/bin/demo
USER nobody
EXPOSE 80
CMD ["/usr/bin/demo"]