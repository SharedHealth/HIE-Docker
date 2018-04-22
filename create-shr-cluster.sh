#!/usr/bin/env bash
set -e

docker-compose down
docker-compose rm
docker-compose build
docker-compose up -d cassandra-follower-server

until docker-compose exec cassandra-seed-server /bin/sh -c "cqlsh -e 'desc keyspaces' | grep freeshr;"
do
   echo "Waiting"
done
docker-compose up -d
