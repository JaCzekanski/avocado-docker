# Avocado Docker CI build enviroments

[![Build Status](https://travis-ci.org/JaCzekanski/avocado-docker.svg?branch=master)](https://travis-ci.org/JaCzekanski/avocado-docker)

## Usage

- Android
```bash
$ docker run -v $(pwd):/home/build avocadoemu/android /bin/bash -ex /home/build/.travis/android/build.sh
```

- Linux
```bash
$ docker run -v $(pwd):/home/build avocadoemu/linux-clang6 /bin/bash -ex /home/build/.travis/linux/build.sh
```
