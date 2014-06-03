# docker-postgresql
#
# VERSION 0.2

FROM centos
MAINTAINER Dave Goehrig dave@dloh.org

# Install EPEL6 for additional packages
RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Development Tools
RUN yum -y groupinstall "Development Tools"

# install pg repo
RUN rpm -i http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

# install server
RUN yum install -y postgresql93-server postgresql93-contrib

# initialize DB data files
RUN su - postgres -c '/usr/pgsql-9.3/bin/initdb -D /var/lib/pgsql/data'

# set permissions to allow logins, trust the bridge, this is the default for docker YMMV
RUN echo "host    all             all             172.17.42.1/32            trust" >> /var/lib/pgsql/data/pg_hba.conf

#listen on all interfaces
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

#expose 5432
EXPOSE 5432

# start the database
CMD su - postgres -c '/usr/pgsql-9.3/bin/postgres -D /var/lib/pgsql/data' 
