FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install --no-install-recommends -yqq\
    fuse\
    cron\
    rsync\
    curl &&\
    rm -rf /var/lib/apt/lists/*

ENV VERSION=0.11.1

RUN curl -s -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v0.11.1_linux_amd64.tar.gz
RUN tar -o -C / -zxf gcsfuse_v${VERSION}_linux_amd64.tar.gz
RUN rm gcsfuse_v${VERSION}_linux_amd64.tar.gz

ADD sync-logs /etc/cron.d/
RUN chmod 0744 /etc/cron.d/sync-logs

CMD ["sh", "-c", "cron && gcsfuse $BUCKET /mnt/bucket"]