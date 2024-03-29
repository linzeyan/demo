FROM golang:1.17-alpine3.14 AS builder
WORKDIR /go/src/app
COPY . .
RUN apk add upx
RUN go mod vendor
RUN CGO_ENABLED=0 go build -trimpath -mod vendor -o demo ./main.go
RUN upx -9 -o /go/bin/demo demo

FROM gcr.io/distroless/base-debian11
COPY --from=builder /go/bin/demo /
EXPOSE 80
ENTRYPOINT ["/demo"]
# docker run -d -p 80:80 zeyanlin/gin-demo '-a' 'aa'