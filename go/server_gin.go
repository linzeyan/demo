//go:build gin
// +build gin

package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func runServer(message string, port int) {
	r := gin.Default()
	r.NoRoute(func(c *gin.Context) {
		c.String(200, message)
	})

	if err := r.Run(listenAddr(port)); err != nil {
		log.Fatal(err)
	}
}
