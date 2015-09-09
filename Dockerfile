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
    rm gcsfuse_v0.11.1_linux_amd64.tar.gz

ADD crontab /etc/cron.d/sync-logs
RUN chmod 0644 /etc/cron.d/sync-logs
RUN update-rc.d cron enable

CMD ["sh", "-c", "gcsfuse $BUCKET /mnt/bucket"]