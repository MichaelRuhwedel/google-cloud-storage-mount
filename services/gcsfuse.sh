#!/usr/bin/env bash
exec gcsfuse $BUCKET /mnt/bucket >> /var/log/gcsfuse.log 2>&1