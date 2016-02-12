#!/usr/bin/env bash

SRC=gs://$BUCKET
DST=/mnt/logfiles_incoming
echo syncing logs from $SRC to $DST

sed -i s/PROJECT_ID/$PROJECT_ID/ ~/.boto

./gsutil -m rsync -r $SRC $DST

 #gsutil will return non zero code when there is nothing to sync -> please check errors for logs
true