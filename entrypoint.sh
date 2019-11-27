#!/bin/bash

echo "Start entrypoint"
sleep 1

echo "Correcting mount point permissions"
chown -fR "$SINUS_USER":"$SINUS_GROUP" -R "$SINUS_DIR"
sleep 2

echo "Checking for youtube-dl updates"
$YTDL_BIN -U
sleep 2

echo "Start sinusbot"
sudo -u "$SINUS_USER" -g "$SINUS_GROUP" "$SINUS_DIR/sinusbot"
