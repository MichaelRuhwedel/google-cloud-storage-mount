#!/usr/bin/env bash
TODAYS_LOGS=bucket/appengine.googleapis.com/request_log/`date +"%Y"`/`date +"%m"`/`date +"%d"`
rsync --ignore-existing -r --chmod=D755,F644 /mnt/$TODAYS_LOGS/* /mnt/logfiles_incoming/$TODAYS_LOGS/