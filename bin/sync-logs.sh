#!/usr/bin/env bash
TODAYS_LOGS=appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`/`date +"%d"`
rsync --ignore-existing -r --chmod=D755,F644 /mnt/bucket/$TODAYS_LOGS /mnt/logfiles_incoming/$TODAYS_LOGS