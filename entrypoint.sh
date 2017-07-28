#!/bin/bash

echo "Start entrypoint"
sleep 1

echo "Checking for youtube-dl updates"
$YTDL_BIN -U
sleep 2

echo "Start sinusbot"
sudo -u "$SINUS_USER" -g "$SINUS_GROUP" "$SINUS_DIR/sinusbot"
sleep 2

echo "Start sleeping"
sleep infinity
