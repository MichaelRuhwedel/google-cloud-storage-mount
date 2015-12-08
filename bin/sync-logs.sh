#!/usr/bin/env bash
RECENT_LOGS=bucket/appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`
rsync --ignore-existing -r --chmod=D755,F644 /mnt/$RECENT_LOGS/* /mnt/logfiles_incoming/$RECENT_LOGS/