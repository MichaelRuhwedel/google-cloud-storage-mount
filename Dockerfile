FROM phusion/baseimage:0.9.17

CMD ["/sbin/my_init"]

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install --no-install-recommends -yqq\
    fuse\
    rsync

ENV VERSION=0.11.1

RUN curl -s -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v${VERSION}/gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    rm gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    apt-get remove -yqq curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD services/gcsfuse.sh /etc/service/gcsfuse/run
ADD bin/* /bin/
ADD cron.d/* /etc/cron.d/

RUN mkdir /mnt/bucket
