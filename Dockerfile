FROM ubuntu:latest
MAINTAINER osama.j@opensooq.com

RUN \
    apt-get update && \
    apt-get install -y nginx curl && \
    curl -o /usr/local/bin/confd -sSL https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    mkdir -p /confd/

ADD start.sh /
ADD confd /confd

RUN chmod +x /usr/local/bin/confd /start.sh && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    sed -i 's/80 default_server/80/' /etc/nginx/nginx.conf

ENTRYPOINT ["/start.sh"]
