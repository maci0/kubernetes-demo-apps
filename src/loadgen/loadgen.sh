#!/bin/bash

PORT=$1
HOST=frontend

while true; do
    for i in {1..1000}
    do
        MESSAGE=$(fortune | tr -d '\n')
        echo "Load generator: posting to $HOST message: $MESSAGE"
        curl -s --data-urlencode "message=$MESSAGE" -X POST http://$HOST:$PORT/message --max-time 10
        sleep $(( ( RANDOM % 10 )  + 1 ))
    done
done
