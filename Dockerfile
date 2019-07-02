FROM golang:1.12.6-alpine

ENV GO111MODULE on

WORKDIR /go/src/app
ADD . /go/src/app

ENV CGO_ENABLED 0
ENV GOPATH /go

RUN apk update && \
  apk add --no-cache git && \
  go get github.com/gin-gonic/gin && \
  go get github.com/jinzhu/gorm && \
  go get github.com/mattn/go-sqlite3

CMD ["go", "run", "main.go"]