#!/bin/bash
set -e

GALERA_FILE="/etc/mysql/mariadb.conf.d/60-galera.cnf"
( echo 'cat <<EOF' ; cat /home/60-galera~.cnf ; echo EOF ) | sh > $GALERA_FILE

CMD="/usr/local/bin/docker-entrypoint.sh mysqld"
LOCKFILE="/var/lib/mysql/cluster_initialized.lock"

if [ "$MARIADB_GALERA_CLUSTER_BOOTSTRAP" = "yes" ]; then
    if [ ! -f "$LOCKFILE" ]; then
        CMD="$CMD --wsrep-new-cluster"
        touch "$LOCKFILE"
    fi
fi

exec $CMD
