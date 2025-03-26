
FROM alpine:latest

# Install V2Ray
RUN apk update && apk add --no-cache \
    bash \
    curl \
    && curl -L -o v2ray.tar.gz https://github.com/v2ray/v2ray-core/releases/download/v4.43.0/v2ray-linux-64.zip \
    && tar -zxvf v2ray.tar.gz && mv v2ray-v4.43.0-linux-64 v2ray && rm -rf v2ray.tar.gz

WORKDIR /v2ray
ENTRYPOINT ["/v2ray/v2ray", "-config", "/etc/v2ray/config.json"]
