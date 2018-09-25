FROM mysql:5.6
COPY *.sql /tmp/
COPY init.sh /tmp/
ENTRYPOINT service mysql restart; tail -f /dev/null