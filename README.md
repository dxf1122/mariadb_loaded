# MariaDB Fully Loaded Demo #

# Summary #
This docker image has 1 MariaDB instance with most plugins and storage engines activated.

* Spider
* RocksDB
* TokuDB
* OQGraph
* Aria
* InnoDB
* Connect
* FederatedX
* Blackhole
* Sequence
* Archive

# Prerequisites #

* [docker](https://www.docker.com/products/docker-desktop)
* [git](https://git-scm.com/downloads)

# Option1: Getting Started Using Github #
```
$ git clone https://github.com/toddstoffel/mariadb_loaded.git
$ cd mariadb_loaded
$ docker build . -t mariadb_loaded
$ docker run -p 3306:3306 -it mariadb_loaded
```
# Option2: Getting Started Using Docker Hub #
```
$ docker pull toddstoffel/mariadb_loaded
$ docker run -p 3306:3306 -it toddstoffel/mariadb_loaded
```
