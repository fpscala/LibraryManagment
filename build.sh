#!/bin/bash

docker pull postgres:11

docker build -t librarymanagment ./deploy/

docker run --name library-db -p 1111:5432 -e 'POSTGRES_PASSWORD=maftunbek1998' -e 'POSTGRES_USER=prince' -d postgres:11

sleep 2s

docker exec -it library-db psql -U prince -c "create database librarymanagment"

cat ./conf/database/db.sql | docker exec -i library-db psql -U prince -d librarymanagment

source ./deploy.sh