#!/bin/bash

PORT=9081 node frontend/build & front_pid=$! &
PORT=9080 ./backend/build/clipsearch_api_server -c backend/config.json & back_pid=$! &

wait $back_pid && wait $front_pid




