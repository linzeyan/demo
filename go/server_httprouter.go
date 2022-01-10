//go:build httprouter
// +build httprouter

package main

import (
	"log"
	"net/http"

	"github.com/julienschmidt/httprouter"
)

func runServer(message string, port int) {
	router := httprouter.New()
	router.NotFound = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		_, _ = w.Write([]byte(message))
	})

	if err := http.ListenAndServe(listenAddr(port), router); err != nil {
		log.Fatal(err)
	}
}
