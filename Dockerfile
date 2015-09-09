FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install -yqq\
    fuse\
    cron\
    rsync\
    curl &&\
    rm -rf /var/lib/apt/lists/*

RUN curl -s -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    rm gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    apt-get remove curl

ADD crontab /etc/cron.d/sync-logs

CMD ["sh", "-c", "cron && gcsfuse $BUCKET /mnt/bucket"]