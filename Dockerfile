# -*- mode: dockerfile -*-

FROM golang:1.16-alpine

ENV GO111MODULE=on

RUN apk --no-cache add ca-certificates

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o /stripe-mock

ENTRYPOINT ["/stripe-mock", "-http-port", "12111", "-https-port", "12112"]
EXPOSE 12111
EXPOSE 12112
