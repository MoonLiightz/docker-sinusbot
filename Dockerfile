FROM debian:jessie

MAINTAINER Patrick Stebbe <info@moonliightz.de>

ENV SINUS_USER="sinusbot" \
    SINUS_GROUP="sinusbot" \
    SINUS_USERID="3000" \
    SINUS_GROUPID="3000" \
    SINUS_DIR="/sinusbot" \
    YTDL_BIN="/usr/local/bin/youtube-dl" \
    TS3_DIR="$SINUS_DIR/TeamSpeak3-Client-linux_amd64" \
    SINUS_VERSION="beta" \
    YTDL_VERSION="latest" \
    TS3_VERSION="3.0.19.4" \
    TS3_OFFSET="25000"

RUN apt-get update && \
    apt-get install -y \
      locales \
      wget \
      sudo \
      x11vnc \
      xinit \
      xvfb \
      xcb \
      screen \
      libxcursor1 \
      libglib2.0-0 \
      python \
      bzip2 \
      sqlite3 \
      ca-certificates && \
    groupadd -g "$SINUS_GROUPID" -r "$SINUS_GROUP" && \
    useradd -u "$SINUS_USERID" -r -g "$SINUS_GROUP" -d "$SINUS_DIR" "$SINUS_USER" && \
    update-ca-certificates && \
    wget --no-check-certificate -q -O "$YTDL_BIN" "https://yt-dl.org/downloads/$YTDL_VERSION/youtube-dl" && \
    chmod 755 -f "$YTDL_BIN" && \
    locale-gen --purge en_US.UTF-8 && \
    echo LC_ALL=en_US.UTF-8 >> /etc/default/locale && \
    echo LANG=en_US.UTF-8 >> /etc/default/locale && \
    mkdir -p "$SINUS_DIR" "$TS3_DIR" && \
    wget -qO- https://www.sinusbot.com/dl/sinusbot-$SINUS_VERSION.tar.bz2 | \
    tar -xjf- -C "$SINUS_DIR" && \
    wget -q -O- "http://dl.4players.de/ts/releases/$TS3_VERSION/TeamSpeak3-Client-linux_amd64-$TS3_VERSION.run" | \
    tail -c +$TS3_OFFSET | \
    tar xzf - -C "$TS3_DIR" && \
    mv -f "$SINUS_DIR/config.ini.dist" "$SINUS_DIR/config.ini" && \
    sed -i "s|TS3Path = .*|TS3Path = \"$TS3_DIR/ts3client_linux_amd64\"|g" "$SINUS_DIR/config.ini" && \
    echo YoutubeDLPath = \"$YTDL_BIN\" >> "$SINUS_DIR/config.ini" && \
    cp -f "$SINUS_DIR/plugin/libsoundbot_plugin.so" "$TS3_DIR/plugins/" && \
    chown -fR "$SINUS_USER":"$SINUS_GROUP" "$SINUS_DIR" "$TS3_DIR" && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 8087

ENTRYPOINT [ "./entrypoint.sh" ]
