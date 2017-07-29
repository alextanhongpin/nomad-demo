package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	serviceURI := os.Getenv("SERVICE_URI")
	if port == "" {
		port = "8080"
	}

	r := http.NewServeMux()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Server working")
	})
	r.HandleFunc("/proxy_numbers", func(w http.ResponseWriter, r *http.Request) {
		resp, err := http.Get(serviceURI)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		log.Println(body)
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprintf(w, `{"data": "%s"}`, "Got numbers!")
	})

	log.Println("Got service uri" + serviceURI)
	log.Printf("Listening to port *:%s. Press ctrl + c to cancel.", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), r)
}
