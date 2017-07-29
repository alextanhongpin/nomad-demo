package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	r := http.NewServeMux()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Server working")
	})
	r.HandleFunc("/numbers", func(w http.ResponseWriter, r *http.Request) {
		log.Println("Calling server at port *:", port)
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprint(w, `{"data": [1, 2, 3, 4, 5]}`)
	})
	log.Printf("Listening to port *:%s. Press ctrl + c to cancel.", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), r)
}
