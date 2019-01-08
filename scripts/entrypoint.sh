#!/bin/bash

/usr/share/mysql/mysql.server start

exec "$@"

/bin/bash
