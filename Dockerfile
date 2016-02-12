FROM python:2.7.11

RUN pip install -U crcmod
RUN curl https://storage.googleapis.com/pub/gsutil.tar.gz | tar -xzC /opt

ADD boto /root/.boto
ADD docker-entrypoint.sh /

WORKDIR /opt/gsutil

ENTRYPOINT /docker-entrypoint.sh