#!/bin/bash

sudo docker run -p 5432 -d -t postgresql su - postgres -c '/usr/pgsql-9.2/bin/postgres -D /var/lib/pgsql/data'
