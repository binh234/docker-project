FROM mariadb:10.5.10

RUN DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confnew' -qqy install galera-4 rsync && \
    rm -rf /var/lib/apt/lists/*

ENV MARIADB_GALERA_CLUSTER_NAME=galera
ENV MARIADB_GALERA_MARIABACKUP_USER=backup_user
ENV MARIADB_GALERA_MARIABACKUP_PASSWORD=backup_password
ENV MARIADB_GALERA_CLUSTER_ADDRESS=gcomm://

COPY start.sh /start.sh
COPY 60-galera.cnf /home/60-galera~.cnf

CMD ["/start.sh"]

EXPOSE 3306 4444 4567 4568