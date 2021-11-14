package main

import (
	"flag"

	"github.com/gin-gonic/gin"
)

var (
	args = flag.String("a", "", "Specify return string")
)

func main() {
	flag.Usage = func() {
		flag.PrintDefaults()
	}
	flag.Parse()
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.String(200, *args)
	})

	r.Run("0.0.0.0:80")
}
