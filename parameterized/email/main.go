package main

import (
	"flag"
	"fmt"
	"time"
)

func main() {
	var data = flag.String("name", "", "The name of the sender")
	var hello = flag.String("hello", "", "The greeting")
	var payload = flag.String("payload", "", "The payload")
	flag.Parse()

	time.Sleep(1 * time.Second)

	// In alloc/logs/email.stderr.0
	// 2018/03/20 16:07:49 log:data john
	// 2018/03/20 16:07:49 log:hello doe
	// 2018/03/20 16:07:49 log:payload
	// log.Println("log:data", *data)
	// log.Println("log:hello", *hello)
	// log.Println("log:payload", *payload)

	// Use fmt so that it prints to stdout, instead of stderr
	// In alloc/logs/email.stdout.0
	// fmt world john -hello=doe
	fmt.Println("fmt:data", *data)
	fmt.Println("fmt:hello", *hello)
	fmt.Println("fmt:payload", *payload)
}
