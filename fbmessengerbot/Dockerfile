FROM golang:1.6.2-alpine

ENV FB_VERIFY_TOKEN fbverifytoken
ENV FB_TOKEN fbtoken
ENV PORT 8080

RUN apk update && apk upgrade && apk add git
RUN go get github.com/stanaka/facebook-messenger
RUN go build -o /go/bin/echo /go/src/github.com/stanaka/facebook-messenger/examples/echo.go
CMD /go/bin/echo

EXPOSE 8080
