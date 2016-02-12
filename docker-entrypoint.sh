#!/usr/bin/env bash
LOGS=appengine.googleapis.com/request_log

SRC=gs://$BUCKET/$LOGS
DST=/mnt/logfiles_incoming/$LOGS

echo syncing logs from $SRC to $DST

sed -i s/PROJECT_ID/$PROJECT_ID/ ~/.boto

mkdir -p $DST

./gsutil -m rsync -r $SRC $DST

 #gsutil will return non zero code when there is nothing to sync -> please check errors for logs
true