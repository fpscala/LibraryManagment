#!/bin/bash

sbt dist

docker run --rm -ti -v $PWD/target/universal/librarymanagment-1.0.zip:/opt/librarymanagment-1.0.zip -p 9000:9000 --link=library-db:postgres -host librarymanagment:latest
