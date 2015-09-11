#!/usr/bin/env bash
set -e
daemon gcsfuse $BUCKET /mnt/bucket
mkdir -p /mnt/bucket/appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`/`date +"%d"`
set -- rsync --ignore-existing -ra /mnt/bucket /mnt/logfiles_incoming
exec "$@"