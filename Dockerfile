FROM debian:bookworm-slim

ENV LANG en_GB.UTF-8

RUN apt-get update && apt-get install -y sudo locales file qemu-user-static binfmt-support curl && rm -rf /var/lib/apt/lists/*

#RUN curl -L https://raw.githubusercontent.com/gitbls/sdm/master/EZsdmInstaller | /usr/bin/env bash
RUN curl -L https://raw.githubusercontent.com/1stcall/sdm/mydev/EZsdmInstaller | /usr/bin/env bash

WORKDIR /

VOLUME [ "/output" ]
VOLUME [ "/baseos" ]
VOLUME [ "/dev" ]

COPY local-plugins/ /local-plugins/
COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
