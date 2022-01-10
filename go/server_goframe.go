//go:build goframe
// +build goframe

package main

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
)

func runServer(message string, port int) {
	s := g.Server()
	s.BindHandler("/", func(r *ghttp.Request) {
		r.Response.Write(message)
	})
	s.BindHandler("/*", func(r *ghttp.Request) {
		r.Response.Write(message)
	})
	s.SetAddr(listenAddr(port))
	s.Run()
}
