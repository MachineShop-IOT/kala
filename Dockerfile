FROM golang:1.9

WORKDIR /go/src/github.com/ajvb/kala
COPY . .
RUN chmod +x run.sh
RUN go build && mv kala /usr/bin

CMD ["./run.sh"]