FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
# Finish setting up server
RUN apt-get update
RUN apt install -y apache2
RUN apt install -y mariadb-server
RUN apt install -y memcached
RUN apt install -y php7.4
RUN apt-get install -y php7.4-mysql php7.4-gd php7.4-curl php7.4-mbstring php7.4-zip php7.4-json
RUN apt-get install -y libfreetype6
RUN apt-get install -y php7.4-memcached
RUN apt-get install -y nano
RUN apt-get install -y phpmyadmin
RUN apt-get install -y wget 
RUN apt-get purge -y javascript-common

COPY conf/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY conf/phpmyadmin.conf /etc/apache2/conf-available/phpmyadmin.conf
COPY conf/mysql.cnf /etc/mysql/conf.d/mysqld.cnf
RUN a2enconf phpmyadmin

# Add webDiplomacy harness
ADD scripts /scripts

# install the database
ADD webDiplomacy/install /db_install
RUN /scripts/init-db.sh

CMD /scripts/docker-entrypoint.sh
