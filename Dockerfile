FROM python:2.7.11-alpine
ENV VERSION_GSUTIL=4.16

RUN apk -U add curl

RUN pip install -U crcmod

RUN mkdir -p /opt\
      && curl --silent https://storage.googleapis.com/pub/gsutil_$VERSION_GSUTIL.tar.gz\
       | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh