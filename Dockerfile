FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -qq &&\
    apt-get install --no-install-recommends -yqq\
    ca-certificates\
    fuse\
    daemon\
    rsync\
    curl &&\
    rm -rf /var/lib/apt/lists/*

ENV VERSION=0.11.1

RUN curl -s -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v${VERSION}/gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    rm gcsfuse_v${VERSION}_linux_amd64.tar.gz &&\
    apt-get remove -yqq curl

COPY docker-cmd.sh /

CMD ["docker-cmd.sh"]