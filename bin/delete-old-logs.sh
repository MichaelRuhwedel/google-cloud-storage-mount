#!/usr/bin/env bash
find /mnt/logfiles_incoming -daystart -mtime +30 -exec rm -r {} \;
