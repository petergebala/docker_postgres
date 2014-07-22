FROM ubuntu
MAINTAINER Piotr Gębala <piotrek.gebala@gmail.com>

# Default user, password, version
ENV USERNAME deployer
ENV PASSWORD depl0yer
ENV VERSION 9.3

# Update system
RUN apt-get -y update
RUN apt-get -y upgrade

# Setup system locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Install correct version of postgres
run apt-get install -y \
            zsh \
            postgresql-$VERSION \
            postgresql-contrib-$VERSION

# Create user
USER postgres
RUN /etc/init.d/postgresql start && psql --command "CREATE USER $USERNAME WITH SUPERUSER PASSWORD '$PASSWORD';"

# Allow external connections
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

USER root
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
CMD ["su", "postgres", "-c", "/usr/lib/postgresql/$VERSION/bin/postgres -D /var/lib/postgresql/$VERSION/main -c config_file=/etc/postgresql/$VERSION/main/postgresql.conf"]
EXPOSE 5432
