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


