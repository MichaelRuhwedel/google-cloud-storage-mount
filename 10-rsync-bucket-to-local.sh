#!/usr/bin/env bash
rsync --ignore-existing -ra /mnt/bucket /mnt/logfiles_incoming >> /var/log/rsync-bucket-to-local.log 2>&1