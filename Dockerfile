FROM python:2.7.11
ENV VERSION_GSUTIL=4.16

RUN pip install -U crcmod
RUN curl --silent https://storage.googleapis.com/pub/gsutil_$VERSION_GSUTIL.tar.gz | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh