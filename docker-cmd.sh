#!/usr/bin/env bash
daemon gcsfuse $BUCKET /mnt/bucket

mkdir -p /mnt/bucket/appengine.googleapis.com/request_log/`date +"%%Y"`/`date +"%%m"`/`date +"%%d"`

exec "rsync --ignore-existing -ra /mnt/bucket /mnt/logfiles_incoming"