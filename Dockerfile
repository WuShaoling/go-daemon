# build env
FROM golang:stretch as builder
ADD ./ /go/src/github.com/daemon/
RUN cd /go/src/github.com/daemon/ && go build -o daemon main.go

# run env
FROM ubuntu:latest
MAINTAINER "Shaoling <wsl6@outlook.com>"
COPY --from=builder /go/src/github.com/daemon/daemon /
RUN chmod +x /daemon
CMD ["/daemon"]