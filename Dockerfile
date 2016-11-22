FROM alpine:latest
MAINTAINER mula.d.m@gmail.com

ENV ANSIBLE_VERSION 2.2.0.0

RUN set -ex \
    && apk add --no-cache py-pip build-base python-dev libffi-dev openssl-dev \
    && pip install --upgrade pip \
    && pip install ansible==$ANSIBLE_VERSION docker-py \
    && mkdir /ansible \
    && apk del build-base py-pip libffi-dev openssl-dev \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

WORKDIR /ansible
ENTRYPOINT ["ansible-playbook"]
