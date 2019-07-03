FROM golang:1.11

ADD dep/dep-linux-amd64 /usr/bin/dep
RUN chmod +x /usr/bin/dep

WORKDIR $GOPATH/src/github.com/MachineShop-IOT/kala
COPY Gopkg.toml Gopkg.lock ./
RUN dep ensure -vendor-only

COPY . .

RUN go build

ENTRYPOINT ./kala run -v --jobstat-ttl=10 --jobDB=mongo --jobDBAddress="$DB_HOST" --jobDBReplicaSet="$DB_REPLICA_SET_NAME"  --jobDBSSL=true -p "$PORT" --jobDBUsername="$DB_USERNAME" --jobDBPassword="$DB_PASSWORD"
