package main

import "flag"

var (
	args = flag.String("a", "", "Specify return string")
	port = flag.Int("p", 80, "Specify listen port")
)

func main() {
	flag.Usage = func() {
		flag.PrintDefaults()
	}
	flag.Parse()
	if *args == "" {
		*args = "Hello, World!"
	}

	runServer(*args, *port)
}
