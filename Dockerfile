FROM phusion/baseimage:0.9.17

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install --no-install-recommends -yqq\
    fuse\
    rsync &&\
    rm -rf /var/lib/apt/lists/*

ENV VERSION=0.11.1

RUN curl -s -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v${VERSION}/gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    rm gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    apt-get remove -yqq curl

RUN mkdir /etc/service/gcsfuse
ADD gcsfuse.sh /etc/service/gcsfuse/run

RUN mkdir /mnt/bucket

RUN mkdir -p /etc/my_init.d
ADD 00-create-todays-log-dir.sh /etc/my_init.d/00-create-todays-log-dir.sh
ADD 10-rsync-bucket-to-local.sh /etc/my_init.d/10-rsync-bucket-to-local.sh