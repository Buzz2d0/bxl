FROM golang:1.17-alpine

WORKDIR /opt/jsonp

ENV GO111MODULE='on'
ENV GOPROXY=https://goproxy.io

COPY ./ ./
RUN go build -ldflags "-s -w" -o main main.go

EXPOSE 8080 8081
CMD ["/opt/jsonp/main"]