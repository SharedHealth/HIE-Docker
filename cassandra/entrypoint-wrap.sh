#!/bin/bash

# Create keyspaces
#!/bin/bash

if [[ $1 = 'cassandra' ]]; then
    FREESHR="CREATE KEYSPACE IF NOT EXISTS freeshr WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
    MCI="CREATE KEYSPACE IF NOT EXISTS mci WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
    HID="CREATE KEYSPACE IF NOT EXISTS healthId WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
    CQL=$FREESHR$MCI$HID
    echo $CQL
    until echo $CQL | cqlsh; do
        echo "cqlsh: Cassandra is unavailable - retry later"
        sleep 2
    done &
fi


exec /docker-entrypoint.sh "$@"
