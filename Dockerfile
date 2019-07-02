FROM golang:1.12.6-alpine

WORKDIR /go
ADD . /go

ENV GOBIN /go/bin
ENV CGO_ENABLED 0

RUN apk add --no-cache git \
  && go get github.com/gin-gonic/gin \
  && go get github.com/jinzhu/gorm \
  && go get github.com/mattn/go-sqlite3 \
  && dep ensure -v

CMD ["go", "run", "main.go"]