FROM --platform=$TARGETPLATFORM golang:1.17-alpine3.14 AS builder
WORKDIR /go/src/app
COPY . .
RUN go mod vendor
ARG TARGETOS TARGETARCH
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -mod vendor -o demo ./main.go

FROM --platform=$TARGETPLATFORM gcr.io/distroless/base-debian11:debug
COPY --from=builder /go/src/app/demo /
EXPOSE 80
ENTRYPOINT ["/demo", "-a"]
CMD [""]
# docker run -d -p 80:80 zeyanlin/gin-demo '-a' 'aa'
# docker buildx build --push --platform linux/arm64,linux/amd64 -t zeyanlin/gin-demo:dev-latest .