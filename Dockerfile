FROM centos:7

RUN yum -y install wget epel-release nano sudo curl which htop git && \
		yum -y update && \
		curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash && \
		yum -y install \
		MariaDB-server \
		MariaDB-backup \
		MariaDB-rocksdb-engine \
		MariaDB-connect-engine \
		MariaDB-tokudb-engine \
		MariaDB-oqgraph-engine \
		MariaDB-aws-key-management \
		MariaDB-cracklib-password-check \
		https://www.percona.com/downloads/percona-toolkit/3.0.13/binary/redhat/7/x86_64/percona-toolkit-3.0.13-1.el7.x86_64.rpm && \
		mkdir -p /root/scripts/ && \
		git clone https://github.com/datacharmer/test_db.git /root/scripts/test_db

COPY scripts/server.cnf /etc/my.cnf.d/server.cnf
COPY scripts/*.sh /root/scripts/
COPY scripts/mariadb_sig.txt /root/scripts/mariadb_sig.txt
COPY scripts/*.sql /root/scripts/
COPY scripts/.my.cnf /root/.my.cnf

RUN chmod +x /root/scripts/*.sh && \
		mkdir -p /var/log/mysql && \
		chown -R mysql:mysql /var/log/mysql

WORKDIR /root/scripts/test_db

RUN /root/scripts/seed.sh && \
		cat /root/scripts/mariadb_sig.txt >> /etc/MOTD && \
		echo "clear;cat /etc/MOTD" >> ~/.bashrc

WORKDIR /root/scripts

ENTRYPOINT ["/root/scripts/entrypoint.sh"]
