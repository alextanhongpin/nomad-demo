package main

import (
	"fmt"
	"log"
)

func main() {
	// This will be logged to server.stderr.0
	log.Println("message log!")

	// The following will be logged to server.stdout.0
	fmt.Println("message fmt")
	fmt.Printf("this is dissapointing")

	// The following does not work
	log.Printf("hahahaaha")
}
