#!/usr/bin/env bash
RECENT_LOGS=appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`

SRC=/mnt/bucket/$RECENT_LOGS/*
DST=/mnt/logfiles_incoming/$RECENT_LOGS

mkdir -p $DST
rsync --ignore-existing -r --chmod=D755,F644 $SRC $DST