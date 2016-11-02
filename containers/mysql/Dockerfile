FROM mysql/mysql-server
RUN rm -f /etc/mysql/mysql.conf.d/mysqld2.conf
ADD mysqld.conf /etc/mysql/mysql.conf.d/mysqld2.conf
#ADD my.cnf /etc/mysql/mysql.conf.d/mysqld2.conf

VOLUME /var/lib/mysql
VOLUME /var/log/mysql

