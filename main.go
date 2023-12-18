package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {

	addr := os.Getenv("SERVER_ADDRESS")
	fmt.Printf("SERVER_ADDRESS: %s\n", addr)

	http.ListenAndServe(addr, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", r.URL.Path)
	}))

}
