### google-cloud-storage-mount

* Rsync's the bucket given as $BUCKET to `/mnt/logfiles_incoming`
* Credentials are given as GOOGLE_APPLICATION_CREDENTIALS and added through a volume: `GOOGLE_APPLICATION_CREDENTIALS=/etc/gcsfuse/my-project-key.json`

Usage
```
docker run\
  --name cloud-storage-logs\
  --privileged\
  --rm\
  -e GOOGLE_APPLICATION_CREDENTIALS=/etc/gcsfuse/key.json\
  -e BUCKET=small-improvements-logs\
  -v /etc/gcsfuse:/etc/gcsfuse\
  -v /mnt/logfiles_incoming:/mnt/logfiles_incoming\
  smallimprovements/google-cloud-storage-mount
```
