package main

import (
	"net"
	"strconv"
)

func listenAddr(port int) string {
	return net.JoinHostPort("0.0.0.0", strconv.Itoa(port))
}
