#!/usr/bin/env bash

# SERV="python3 -m http.server --bind=127.0.0.1 7070"
SERV="go run ./backend/main.go"

elm make ./src/Main.elm --output="app.js" && $SERV
