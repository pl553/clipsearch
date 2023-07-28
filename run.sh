#!/bin/bash

trap 'trap " " SIGTERM; kill 0; wait;' SIGINT SIGTERM

PORT=9081 node frontend/build &
PORT=9080 ./backend/clipsearch




