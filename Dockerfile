FROM python:2.7.11

RUN pip install -U crcmod
RUN curl https://storage.googleapis.com/pub/gsutil.tar.gz | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh