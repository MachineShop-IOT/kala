FROM golang:1.9

WORKDIR /go/src/github.com/ajvb/kala
COPY . .
RUN go build && mv kala /usr/bin
RUN chmod +x run.sh

CMD ["./run.sh"]