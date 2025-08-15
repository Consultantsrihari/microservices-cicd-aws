package main

import (
    "fmt"
    "net/http"
    "time"
)

func main() {
    fmt.Println("Go Processor starting...")

    // Simulate some background work
    go func() {
        for {
            fmt.Println("Processing data...")
            time.Sleep(10 * time.Second)
        }
    }()

    // Expose a health check endpoint
    http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "ok")
    })
    http.ListenAndServe(":8081", nil)
}