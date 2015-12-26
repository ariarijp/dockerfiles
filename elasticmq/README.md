# ElasticMQ Docker Image

Docker image based on Ubuntu trusty with the latest [ElasticMQ](https://github.com/adamw/elasticmq).

This repository is forked from [pakohan/dockerfiles](https://github.com/pakohan/dockerfiles)

## Usage

```sh
$ # Pull image from Docker Hub
$ docker pull ariarijp/elasticmq

$ # Or you can build your own image
$ docker build -t ariarijp/elasticmq .

$ # Run a container
$ docker run --rm -p 9324:9324 ariarijp/elasticmq
```

## Testing

I highly recommend using [virtualenv](https://virtualenv.readthedocs.org/en/latest/).

```sh
$ # You have to run a elasticmq container before testing
$ cd boto-tests
$ virtualenv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
$ python tests.py
```

## License

MIT

## Author

[@ariarijp](https://twitter.com/ariarijp)
