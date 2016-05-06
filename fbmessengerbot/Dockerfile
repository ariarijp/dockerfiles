FROM golang:1.6.2-alpine

ENV FB_VERIFY_TOKEN fbverifytoken
ENV FB_TOKEN fbtoken
ENV PORT 80

RUN apk update && apk upgrade && apk add git

RUN mkdir /go/src/fbmessenger
COPY main.go /go/src/fbmessenger/
RUN cd /go/src/fbmessenger && go get
RUN go build -o /go/bin/fbmessenger /go/src/fbmessenger/main.go
CMD /go/bin/fbmessenger

EXPOSE ${PORT}
