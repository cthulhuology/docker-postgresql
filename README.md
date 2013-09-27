docker-postgresql
=================

A docker.io recipe for generating a postgresql appliance to serve as the base of other appliances

Getting Started
---------------

You can build this container from Github via

	docker build -t postgresql github.com/cthulhuology/docker-postgresql


You can optionally pull the latest version from the docker.io index using:

	docker pull cthulhuology/postgresql


To run the container you can do the following:

	docker run -p 5432:5432 -i -d -t cthulhuology/postgresql

	psql -U postgres -h localhost -p 5432


Be default it is configured to trust any user on the default bridge interface (172.17.42.1) you may need to 
change this should that conflict with another bridge on your network.


