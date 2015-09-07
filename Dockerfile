FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install -yqq\
    fuse\
    rsync\
    curl &&\
    rm -rf /var/lib/apt/lists/*

ENV GCS_FUSE_VERSION 0.11.1

RUN curl -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v$GCS_FUSE_VERSION_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v$GCS_FUSE_VERSION_linux_amd64.tar.gz &&\
    rm gcsfuse_v$GCS_FUSE_VERSION_linux_amd64.tar.gz

ADD crontab /etc/cron.d/sync-logs
RUN chmod 0644 /etc/cron.d/sync-logs

CMD ["sh", "-c", "gcsfuse --implicit-dirs $BUCKET /mnt/bucket"]