FROM ubuntu:latest 
LABEL maintainer="joaovieira@hotmail.com.br,thiago@email.com" 

# #ALPINE
# RUN apk update && apk add \
#     --no-cache --upgrade bash moreutils wget git make musl-dev go curl jq py3-pip bind-tools \
#     && rm -rf /var/cache/apk/*

#UBUNTU
RUN apt-get update && apt-get -y install \
    wget curl python3-pip git make dnsutils moreutils jq lsb-release sudo iputils-ping \
    && wget "https://dl.google.com/go/$(curl https://go.dev/VERSION?m=text).linux-amd64.tar.gz" -O /tmp/go.tar.gz \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && apt-get clean all \
    && rm -rf /var/cache/apt/archives/*
ENV PATH="${PATH}:/usr/local/go/bin"

COPY /src/* /usr/local/bin

RUN chmod +x /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/recon.sh

RUN /usr/local/bin/install.sh

ENTRYPOINT ["/bin/bash"]