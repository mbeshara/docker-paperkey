FROM alpine:3.12.1

LABEL maintainer="Matthew Beshara <matt.beshara@gmail.com>"

RUN \
    apk add --no-cache make build-base && \
    wget https://github.com/dmshaw/paperkey/releases/download/v1.6/paperkey-1.6.tar.gz && \
    tar -C /tmp -xf paperkey-1.6.tar.gz && \
    cd /tmp/paperkey-1.6 && \
    ./configure && \
    make && \
    make install && \
    rm /paperkey-1.6.tar.gz && \
    rm -rf /tmp/paperkey-1.6 && \
    apk del make build-base

ENTRYPOINT ["/usr/local/bin/paperkey"]

CMD ["--help"]
