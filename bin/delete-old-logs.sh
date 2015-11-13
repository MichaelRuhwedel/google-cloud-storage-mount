#!/usr/bin/env bash
find /mnt/logfiles_incoming -daystart -mtime +2 -exec rm {}\;
