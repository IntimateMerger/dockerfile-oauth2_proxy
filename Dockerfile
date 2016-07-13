FROM alpine:3.4

# timezone
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

ENV VERSION=2.1 \
    ARCH=linux-amd64.go1.6

RUN apk add --no-cache curl && \
    curl -sSL "https://github.com/bitly/oauth2_proxy/releases/download/v${VERSION}/oauth2_proxy-${VERSION}.${ARCH}.tar.gz" | tar -xvz -C /tmp && \
    mv /tmp/oauth2_proxy-${VERSION}.${ARCH}/oauth2_proxy /usr/local/bin/oauth2_proxy && \
    rm -rf /tmp/*

ENV COOKIE_SECRET="secret" \
    COOKIE_DOMAIN=""

EXPOSE 4180
CMD oauth2_proxy \
    -http-address=0.0.0.0:4180 \
    -upstream=${UPSTREAM} \
    -client-id=${CLIENT_ID} \
    -client-secret=${CLIENT_SECRET} \
    -email-domain=${EMAIL_DOMAIN} \
    -cookie-secret=${COOKIE_SECRET} \
    -cookie-domain=${COOKIE_DOMAIN}
