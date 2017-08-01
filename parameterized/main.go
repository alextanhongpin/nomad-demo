package main

import (
	"flag"
	"log"
)

func main() {
	var email = flag.String("email", "", "The email that you want to send out")
	flag.Parse()
	log.Println(*email)
}
