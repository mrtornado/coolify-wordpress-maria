FROM alpine:3.16

RUN apk add --no-cache \
    bash \
    curl \
    jq \
    php8 \
    unzip

COPY install-redis-plugin.sh /install-redis-plugin.sh
RUN chmod +x /install-redis-plugin.sh

ENTRYPOINT ["/install-redis-plugin.sh"]