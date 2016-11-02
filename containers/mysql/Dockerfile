FROM mysql/mysql-server
RUN rm -f /etc/mysql/mysql.conf.d/mysqld2.conf
ADD mysqld.conf /etc/mysql/mysql.conf.d/mysqld2.conf
CMD /sbin/service mysqld start
EXPOSE 3306

