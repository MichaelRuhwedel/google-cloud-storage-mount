FROM python:2.7.13-alpine
ENV VERSION_GSUTIL=4.22

RUN apk --no-cache add\
    curl

RUN pip install --no-cache-dir\
    crcmod

RUN mkdir -p /opt\
      && curl --silent https://storage.googleapis.com/pub/gsutil_$VERSION_GSUTIL.tar.gz\
       | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh