#!/usr/bin/env bash
mkdir -p /mnt/bucket/appengine.googleapis.com/request_log/`date +"%%Y"`/`date +"%%m"`/`date +"%%d"` >> /var/log/create-todays-log-dir.log 2>&1
exit 0