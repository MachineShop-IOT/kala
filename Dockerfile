FROM golang:1.9

WORKDIR /go/src/github.com/MachineShop-IOT/kala
COPY . .
RUN go build

ENTRYPOINT ./kala run -v --jobstat-ttl=10 --jobDB=mongo --jobDBAddress="$DB_HOST" --jobDBReplicaSet="$DB_REPLICA_SET_NAME"  --jobDBSSL=true -p "$PORT" --jobDBUsername="$DB_USERNAME" --jobDBPassword="$DB_PASSWORD"