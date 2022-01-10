//go:build !gin && !echo && !httprouter && !iris && !beego && !goframe && !fiber && !chi
// +build !gin,!echo,!httprouter,!iris,!beego,!goframe,!fiber,!chi

package main

import (
	"log"
	"net/http"
)

func runServer(message string, port int) {
	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		_, _ = w.Write([]byte(message))
	})

	if err := http.ListenAndServe(listenAddr(port), mux); err != nil {
		log.Fatal(err)
	}
}
