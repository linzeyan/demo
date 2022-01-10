//go:build chi
// +build chi

package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
)

func runServer(message string, port int) {
	r := chi.NewRouter()
	r.NotFound(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		_, _ = w.Write([]byte(message))
	})

	if err := http.ListenAndServe(listenAddr(port), r); err != nil {
		log.Fatal(err)
	}
}
