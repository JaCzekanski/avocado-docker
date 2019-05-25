# Avocado Docker CI build enviroments

## Usage

- Android
```bash
$ docker run -v $(pwd):/home/build avocadoemu/android /bin/bash -ex /home/build/.travis/android/build.sh
```

- Linux
```bash
$ docker run -v $(pwd):/home/build avocadoemu/linux-clang6 /bin/bash -ex /home/build/.travis/linux/build.sh
```

## TODO

- Add Travis configuration for automatic Docker image builds and deploys