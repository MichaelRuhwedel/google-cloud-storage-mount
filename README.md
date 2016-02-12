### google-cloud-storage-mount

* Rsync's the Appengine logs from a Google Cloud storage bucket to `/mnt/logfiles_incoming`
* The image takes the following parameters:
   * -e BUCKET : bucket name
   * -e PROJECT_ID : project id  
* Credentials need to be mounted as /etc/gcsfuse/gs_service_key_file.json

Usage
```
docker run\
  --name cloud-storage-logs\  
  --rm\
  -e GOOGLE_APPLICATION_CREDENTIALS=/etc/gcsfuse/key.json\
  -e BUCKET=small-improvements-logs-eu\
  -e PROJECT_ID=small-eu\  
  -v /etc/gcsfuse/key-small-improvements-prod-eu.json:/etc/gcsfuse/gs_service_key_file.json\
  -v /mnt/logfiles_incoming_eu:/mnt/logfiles_incoming\  
  smallimprovements/google-cloud-storage-mount
```
