#!/usr/bin/env bash
rsync --ignore-existing -ra --chmod=D755,F644 /mnt/bucket /mnt/logfiles_incoming