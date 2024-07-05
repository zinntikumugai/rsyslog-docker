FROM debian:bookworm-slim

RUN apt update \
    && apt install -y --no-install-recommends \
        rsyslog \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && touch /var/log/syslog \
    && chmod 777 /var/log/syslog

COPY rsyslog.conf /etc/rsyslog.conf

CMD ["/usr/sbin/rsyslogd", "-n", "-iNONE"]
LABEL org.opencontainers.image.source https://github.com/zinntikumugai/rsyslog-docker