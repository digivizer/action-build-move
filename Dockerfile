FROM ubuntu:18.04

LABEL version="1.0.0"
LABEL repository="https://github.com/convox/actions-export"
LABEL homepage="https://convox.com/convox"
LABEL maintainer="Convox <support@convox.com>"

LABEL "com.github.actions.name"="Convox Export"
LABEL "com.github.actions.description"="Run a command"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="blue"

RUN apt-get -qq update && apt-get -qq -y install curl

RUN curl -L https://github.com/convox/convox/releases/latest/download/convox-linux -o /tmp/convox \
    && mv /tmp/convox /usr/local/bin/convox \
    && chmod 755 /usr/local/bin/convox

RUN apt-get install bash
RUN bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]