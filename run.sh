#!/bin/bash

kala run --jobstat-ttl=10 --jobDB=mongo --jobDBAddress=$DB_HOST --jobDBReplicaSet=$DB_REPLICA_SET_NAME  --jobDBSSL=true -p $PORT --jobDBUsername=$DB_USERNAME --jobDBPassword=$DB_PASSWORD