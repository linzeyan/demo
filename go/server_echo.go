//go:build echo
// +build echo

package main

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
)

func runServer(message string, port int) {
	e := echo.New()
	e.Any("/*", func(c echo.Context) error {
		return c.String(http.StatusOK, message)
	})

	if err := e.Start(listenAddr(port)); err != nil && err != http.ErrServerClosed {
		log.Fatal(err)
	}
}
