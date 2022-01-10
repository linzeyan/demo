//go:build fiber
// +build fiber

package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
)

func runServer(message string, port int) {
	app := fiber.New()
	app.All("/*", func(c *fiber.Ctx) error {
		return c.SendString(message)
	})

	if err := app.Listen(listenAddr(port)); err != nil {
		log.Fatal(err)
	}
}
