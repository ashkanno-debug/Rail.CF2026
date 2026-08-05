FROM alpine:latest

# نصب پیش‌نیازها
RUN apk add --no-cache bash curl ca-certificates tzdata sqlite

# نصب X-UI (نسخه ساده)
RUN mkdir -p /usr/local/x-ui /etc/x-ui && \
    curl -Lo /tmp/x-ui-linux-amd64.tar.gz https://github.com/localzet-dev/X-UI/releases/latest/download/x-ui-linux-amd64.tar.gz && \
    tar -C /usr/local/ -xzf /tmp/x-ui-linux-amd64.tar.gz && \
    rm -f /tmp/x-ui-linux-amd64.tar.gz

# نصب cloudflared
RUN curl -Lo /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

WORKDIR /usr/local/x-ui

# کپی کانفیگ و اسکریپت
COPY config.json /etc/x-ui/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
