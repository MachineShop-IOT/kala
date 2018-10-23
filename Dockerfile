FROM golang:1.9 AS builder

WORKDIR /go/src/github.com/MachineShop-IOT/kala
COPY . .
RUN chmod +x run.sh && mv run.sh /run.sh
RUN make build-static

FROM scratch
COPY --from=builder /kala ./
ENTRYPOINT ./kala run --jobstat-ttl=10 --jobDB=mongo --jobDBAddress="$DB_HOST" --jobDBReplicaSet="$DB_REPLICA_SET_NAME"  --jobDBSSL=true -p "$PORT" --jobDBUsername="$DB_USERNAME" --jobDBPassword="$DB_PASSWORD"