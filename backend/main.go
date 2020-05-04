package main

import (
    "fmt"
    "net/http"
    )

func main() {
    mux := http.NewServeMux();
    mux.Handle("/", http.FileServer(http.Dir("./")));

    mux.HandleFunc("/contact",
        func ( w http.ResponseWriter, r *http.Request ) {
            http.ServeFile(w, r, "./index.html");
    });

    fmt.Println("Serving on port 7070");
    err := http.ListenAndServe(":7070", mux);
    if err != nil {
        fmt.Println(err);
        return
    };
};
