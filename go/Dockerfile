FROM --platform=$TARGETPLATFORM golang:bookworm AS builder
WORKDIR /go/src/app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG BUILD_TAGS=""
ARG LDFLAGS="-s -w"
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -tags "$BUILD_TAGS" -ldflags "$LDFLAGS" -o demo .

FROM --platform=$TARGETPLATFORM gcr.io/distroless/base-debian12:debug
COPY --from=builder /go/src/app/demo /
EXPOSE 80
ENTRYPOINT ["/demo", "-a"]
CMD [""]
