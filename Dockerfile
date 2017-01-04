FROM alpine:3.5
ENV VERSION_GSUTIL=4.22

RUN apk --no-cache add\
    python-dev\
    py-crcmod\
    gcc\
    curl

RUN mkdir -p /opt\
      && curl --silent https://storage.googleapis.com/pub/gsutil_$VERSION_GSUTIL.tar.gz\
       | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh