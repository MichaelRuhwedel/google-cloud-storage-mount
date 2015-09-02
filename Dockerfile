FROM debian:wheezy

RUN mkdir /mnt/bucket

RUN DEBIAN_FRONTEND=noninteractive\
    apt-get update -q &&\
    apt-get install -yq\
    fuse\
    curl &&\
    rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.11.1/gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    tar -o -C / -zxf gcsfuse_v0.11.1_linux_amd64.tar.gz &&\
    rm gcsfuse_v0.11.1_linux_amd64.tar.gz

CMD ["sh", "-c", "gcsfuse --implicit-dirs $BUCKET /mnt/bucket"]