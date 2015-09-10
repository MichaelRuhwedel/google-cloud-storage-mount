/FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install -yqq\
    fuse\
    cron\
    rsync\
    curl &&\
    rm -rf /var/lib/apt/lists/*

RUN curl -Ls https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v0.11.1_linux_amd64.tar.gz | tar zxC / &&\
    apt-get remove -yqq curl

ADD sync-logs /etc/cron.d/
RUN chmod 0744 /etc/cron.d/sync-logs

CMD ["sh", "-c", "cron && gcsfuse $BUCKET /mnt/bucket"]