FROM debian:stable-slim as builder

ARG monero_url=https://downloads.getmonero.org/cli/monero-linux-x64-v0.17.1.9.tar.bz2

ARG monero_checksum=0fb6f53b7b9b3b205151c652b6c9ca7e735f80bfe78427d1061f042723ee6381

WORKDIR /tmp

RUN apt-get update

RUN apt-get install wget tar bzip2 -y

RUN wget ${monero_url} -O monero.tar.bz2

RUN echo "${monero_checksum} monero.tar.bz2" | sha256sum -c || exit 1

RUN tar -xvjf monero.tar.bz2 --strip-component=1


FROM debian:stable-slim

COPY --from=builder /tmp/monerod /usr/bin/

VOLUME ["/monero"]

ENTRYPOINT [ \
    "/usr/bin/monerod", \
    "--data-dir", "/monero", \
    "--prune-blockchain", \
    "--sync-pruned-blocks", \
    "--enable-dns-blocklist", \
    "--non-interactive" \
    ]