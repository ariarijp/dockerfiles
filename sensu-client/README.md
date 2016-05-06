# ariarijp/sensu-client

Dockerfile for Sensu Client.

## Usage

### Put .pem files

You have to put `key.pem` and `cert.pem` on `files/ssl_certs/` directory.

### Building and running

After that, you can excecute `docker build` and `docker run`.

```Shell
docker build -t ariarijp/sensu-client .
docker run -d -P --link sensu-server:sensu-server ariarijp/sensu-client
```
