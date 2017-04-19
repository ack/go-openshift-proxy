package main

import (
	"fmt"
	"log"
	"os"
	"net/http"
	"net/http/httputil"
	"net/url"
	"time"
)


func main() {
	target := os.Getenv("target")
	if target == "" {
		log.Panicf("Missing required ENV var target")
	}
	parsed, err := url.Parse(fmt.Sprintf("http://%s", target))
	if err != nil {
		log.Panicf("Failed parsing url: %s", fmt.Sprintf("http://%s", target))
	}
	proxy := httputil.NewSingleHostReverseProxy(parsed)

	s := &http.Server{
		Addr:           ":80",
		Handler:        proxy,
		ReadTimeout:    60 * time.Second,
		WriteTimeout:   60 * time.Second,
		MaxHeaderBytes: 1 << 20,
	}
	log.Fatal(s.ListenAndServe())
}
