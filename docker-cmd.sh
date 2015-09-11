#!/usr/bin/env bash
set -e
cron
set -- gcsfuse $BUCKET /mnt/bucket
exec "$@"