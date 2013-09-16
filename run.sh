#!/bin/bash

CONTAINER=$(sudo docker run -p 5432 -d -t postgresql su - postgres -c '/usr/pgsql-9.3/bin/postgres -D /var/lib/pgsql/data')
PORT=$(sudo docker port $CONTAINER 5432)

echo "Postgresql running on *:$PORT"
echo "psql -h localhost -p $PORT -U docker"
