#!/bin/bash

/usr/bin/nova-manage db sync
/usr/bin/nova-manage api_db sync

exec /usr/sbin/apache2ctl "$@"
