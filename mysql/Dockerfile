FROM mysql:5.6
COPY *.sql /tmp/	
ENTRYPOINT service mysql start;mysql -uroot < /tmp/init.sql;mysql -uroot terminologies < /tmp/tr-dump.sql; tail -f /dev/null