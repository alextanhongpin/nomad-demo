package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")

	// var port = flag.String("PORT", "8080", "The application port")
	if port == "" {
		port = "8080"
	}
	flag.Parse()
	r := http.NewServeMux()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "hello world")
	})
	log.Printf("Listening to port *:%s. Press ctrl + c to cancel.", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), r)
}
