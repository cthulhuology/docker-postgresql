# docker-postgresql
#
# VERSION 0.1

FROM centos
MAINTAINER Dave Goehrig dave@dloh.org

# Install EPEL6 for additional packages
RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Development Tools
RUN yum -y groupinstall "Development Tools"

# install pg repo
RUN rpm -i http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-redhat92-9.2-7.noarch.rpm

# install server
RUN yum install -y postgresql92-server postgresql92-contrib

# initialize DB data files
RUN su - postgres -c '/usr/pgsql-9.2/bin/initdb -D /var/lib/pgsql/data'

# create a script to setup a nonpriv user, db
RUN echo "su - postgres -c '/usr/pgsql-9.2/bin/postgres -D /var/lib/pgsql/data' &" > setup.sh
RUN echo "su - postgres -c '/usr/pgsql-9.2/bin/createuser -d -r -s -P docker'" >> setup.sh
RUN echo "su - postgres -c '/usr/pgsql-9.2/bin/createdb -O docker docker'" >> setup.sh
RUN chmod u+x setup.sh

# set permissions to allow logins
RUN echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/data/pg_hba.conf

#listen on all interfaces
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

# start the datbase
CMD su - postgres -c '/usr/pgsql-9.2/bin/postgres -D /var/lib/pgsql/data'

# open the port
EXPOSE 5432

