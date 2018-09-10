# moonliightz/sinusbot
[![Build Status](https://travis-ci.org/MoonLiightz/docker-sinusbot.svg?branch=master)](https://travis-ci.org/MoonLiightz/docker-sinusbot)
[![](https://images.microbadger.com/badges/image/moonliightz/sinusbot.svg)](https://microbadger.com/images/moonliightz/sinusbot "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/moonliightz/sinusbot.svg)](https://microbadger.com/images/moonliightz/sinusbot "Get your own version badge on microbadger.com")

This container provides a sinusbot instance. 


## Table of Contents
- [Version](#version)
- [Download / Update](#download--update)
- [Usage](#usage)
- [Logging](#logging)
- [Permissions](#permissions)
- [Acknowledgments](#acknowledgments)
- [License](#license)



## Version

- Sinusbot: 0.14.3-0e747fd
- TeamSpeak: 3.2.1



## Download / Update
```sh
docker pull moonliightz/sinusbot:latest
```



## Usage
```sh
$ docker run -d -v /home/sinusbot/data:/sinusbot/data -p 8087:8087 --name sinusbot moonliightz/sinusbot:latest
```

- ``` /home/sinusbot/data ``` is the directory on your local machine where your bot files will be stored
- ``` /sinusbot/data ``` is the directory on the docker machine.
> **Note:** Don't change `/sinusbot/data` on your docker machine. The source code is based on this directory.



## Logging
```sh 
$ docker logs -f <name of container e.g. sinusbot> 
``` 
Use it to get the password for the web interface and to see the logs.



## Permissions
The default **UID** and **GID** of the user in the container is _3000_.



## Acknowledgments
* [SinusBot](http://www.sinusbot.com/) by Michael Friese.



## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
