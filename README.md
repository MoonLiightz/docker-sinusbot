# moonliightz/sinusbot

[![](https://images.microbadger.com/badges/image/moonliightz/sinusbot.svg)](https://microbadger.com/images/moonliightz/sinusbot "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/moonliightz/sinusbot.svg)](https://microbadger.com/images/moonliightz/sinusbot "Get your own version badge on microbadger.com")

## Usage

```sh
$ docker run -d -v /home/sinusbot/data:/sinusbot/data -p 8087:8087 --name sinusbot sinusbot:latest
```

- ``` /home/sinusbot/data ``` is the directory on your local machine where your bot files will be stored
- ``` /sinusbot/data ``` is the directory on the docker machine (don't change it)

## Logs

```sh 
$ docker logs -f <name of container e.g. sinusbot> 
``` 
Use it to get the password for the web interface and to see the logs.

## Permissions

The default UID and GID of the user in the container is 3000.
