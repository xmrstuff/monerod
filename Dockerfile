FROM debian:stable-slim as builder

ARG monero_url=https://downloads.getmonero.org/cli/linux64

WORKDIR /tmp

RUN apt update

RUN apt install wget tar bzip2 -y

RUN wget ${monero_url} -O monero.tar.bz2

RUN tar -xvjf monero.tar.bz2 --strip-component=1


FROM debian:stable-slim

COPY --from=builder /tmp/monerod /usr/bin/

CMD ["/usr/bin/monerod", "--version"]