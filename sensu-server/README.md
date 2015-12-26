# Project Name

Dockerfile for Sensu Server.

## Usage

```Shell
docker build -t ariarijp/sensu-server .
docker run -d -P --name sensu-server ariarijp/sensu-server
```

### Find your container's forwarded ports (with jq)

```Shell
docker inspect sensu-server | jq ".[0].NetworkSettings.Ports"
```

### Copy .pem files from the container

SSL certificates and authority files will create on `docker run` command.

You can retrieve some files from the container.
If you'd like to run `ariarijp/sensu-client`, you will need these files.

```Shell
docker cp sensu-server:/tmp/ssl_certs/client/key.pem ./
docker cp sensu-server:/tmp/ssl_certs/client/cert.pem ./
```
