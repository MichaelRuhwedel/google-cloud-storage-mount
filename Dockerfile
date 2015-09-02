FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN apt-get update && apt-get install -y fuse curl && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    rm gcsfuse_v0.11.1_linux_amd64.tar.gz

CMD ["gcsfuse", "$BUCKET", "/mnt/bucket]