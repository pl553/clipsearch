#!/bin/bash

trap 'trap " " SIGTERM; kill 0; wait;' SIGINT SIGTERM

PORT=9081 ORIGIN=http://localhost node frontend/build &
(cd backend/clip_daemons && python3.11 text_embedding_daemon.py) &
(cd backend/clip_daemons && python3.11 image_embedding_daemon.py) &
PORT=9080 POSTGRESQL_URL=postgres://clipsearch:weakpassword@localhost:5432/clipsearch?sslmode=disable ./backend/clipsearch




