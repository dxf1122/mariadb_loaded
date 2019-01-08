#!/bin/bash

/usr/share/mysql/mysql.server start
mysql --user="root" --password="" < /root/scripts/mariadb.sql
mysql < /root/scripts/plugins.sql
mysql < /usr/share/mysql/install_spider.sql
mysql < /root/scripts/test_db/employees.sql
/usr/share/mysql/mysql.server stop
