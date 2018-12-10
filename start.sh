#!/bin/bash

# No migration? No seeding? Seriously?
if echo "show dbs" | mongo | grep --quiet "leanote"; then
    echo "Database already initialized"
else
    echo "Initialilze database"
    /usr/local/bin/docker-entrypoint.sh mongod --fork --syslog
    mongorestore -h localhost -d leanote --dir /leanote_db_bootstrap
    /usr/local/bin/docker-entrypoint.sh mongod --shutdown
fi

/usr/local/bin/docker-entrypoint.sh mongod
