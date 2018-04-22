FROM cassandra:2.1

COPY entrypoint-wrap.sh /entrypoint-wrap.sh
ENTRYPOINT chmod +x entrypoint-wrap.sh && ./entrypoint-wrap.sh cassandra -f
