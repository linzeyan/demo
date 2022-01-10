//go:build iris
// +build iris

package main

import (
	"log"

	"github.com/kataras/iris/v12"
)

func runServer(message string, port int) {
	app := iris.New()
	app.Any("/", func(ctx iris.Context) {
		_, _ = ctx.WriteString(message)
	})
	app.Any("/{path:path}", func(ctx iris.Context) {
		_, _ = ctx.WriteString(message)
	})

	if err := app.Listen(listenAddr(port)); err != nil {
		log.Fatal(err)
	}
}
