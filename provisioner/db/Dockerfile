# Follows: https://wiki.postgresql.org/wiki/Apt
FROM ubuntu:12.04
MAINTAINER Cameron Maske "cam@trackmaven.com"

RUN apt-get -y --force-yes install wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get -y update
RUN apt-get -y --force-yes install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 sudo

ADD config/pg_hba.conf /etc/postgresql/9.3/main/
ADD config/postgresql.conf /etc/postgresql/9.3/main/
RUN chown postgres:postgres /etc/postgresql/9.3/main/

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# Update + remove unnecessary packages
RUN apt-get update
RUN apt-get autoremove -y

VOLUME ["/data"]

# Set the defaults for what user/database you want to create
ENV POSTGRESQL_USER db_user
ENV POSTGRESQL_PASS password
ENV POSTGRESQL_DB database

EXPOSE 5432
CMD ["usr/local/bin/run"]