# ariarijp/bonnie

Dockerfile for bonnie++.

## Usage

Build the container.

```Shell
docker build -t ariarijp/bonnie .
```

or pull from Docker Hub.

```Shell
docker pull ariarijp/bonnie
```

then, run it.

```Shell
docker run -i -t ariarijp/bonnie -d /tmp -s 512 -r 256 -u root
```
