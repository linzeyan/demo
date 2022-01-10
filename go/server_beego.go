//go:build beego
// +build beego

package main

import "github.com/beego/beego/v2/server/web"

var beegoMessage string

type rootController struct {
	web.Controller
}

func (c *rootController) Get() {
	c.Ctx.WriteString(beegoMessage)
}

func (c *rootController) Any() {
	c.Ctx.WriteString(beegoMessage)
}

func runServer(message string, port int) {
	beegoMessage = message
	web.BConfig.Listen.HTTPAddr = "0.0.0.0"
	web.BConfig.Listen.HTTPPort = port
	web.Router("/*", &rootController{})

	web.Run()
}
