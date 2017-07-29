package main

import (
	"fmt"
	"log"
)

func main() {
	// This will be logged out
	log.Println("message log!")

	// The following does not work
	fmt.Println("message fmt")
	fmt.Printf("this is dissapointing")
	log.Printf("hahahaaha")
}
