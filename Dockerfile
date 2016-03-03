FROM gliderlabs/alpine:3.3

ENV TZ=Asia/Tokyo \
    VERSION=2.0.1 \
    ARCH=linux-amd64.go1.4.2

RUN apk update \
    && apk add tzdata openssl util-linux \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && wget "https://github.com/bitly/oauth2_proxy/releases/download/v${VERSION}/oauth2_proxy-${VERSION}.${ARCH}.tar.gz" \
    && tar xvfz oauth2_proxy-${VERSION}.${ARCH}.tar.gz \
    && mv oauth2_proxy-${VERSION}.${ARCH}/oauth2_proxy /usr/local/bin/oauth2_proxy \
    && rm -fr oauth2_proxy-${VERSION}.${ARCH}* \
    && apk del tzdata openssl \
    && rm -rf /var/cache/apk/*

EXPOSE=4180

CMD oauth2_proxy \
    --cookie-secret=$(uuidgen) \
    --http-address=0.0.0.0:4180 \
    --upstream=${UPSTREAM} \
    --client-id=${CLIENT_ID} \
    --client-secret=${CLIENT_SECRET}
