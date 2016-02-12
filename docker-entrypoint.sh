#!/usr/bin/env bash
CURRENT_MONTH_LOGS=appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`

SRC=gs://$BUCKET/$CURRENT_MONTH_LOGS
DST=/mnt/logfiles_incoming/$CURRENT_MONTH_LOGS

echo syncing logs from $SRC to $DST

sed -i s/PROJECT_ID/$PROJECT_ID/ ~/.boto

./gsutil -m rsync -r $SRC $DST