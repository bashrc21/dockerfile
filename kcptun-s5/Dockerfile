FROM alpine

ENV RINETD_VERSION 0.73
ENV RINETD_URL https://github.com/samhocevar/rinetd/releases/download/v${RINETD_VERSION}/rinetd-${RINETD_VERSION}.tar.gz
ENV KCPTUN_VERSION 20210103
ENV KCPTUN_FILE kcptun-linux-amd64-${KCPTUN_VERSION}.tar.gz
ENV KCPTUN_URL https://github.com/xtaci/kcptun/releases/download/v${KCPTUN_VERSION}/${KCPTUN_FILE}

COPY socks5 /usr/local/bin
COPY rinetd.conf /etc

RUN set -xe \
    && apk add --no-cache build-base curl tar \
	&& curl -sSL ${KCPTUN_URL} | tar xz -C /usr/local/bin \
    && mkdir rinetd \
    && cd rinetd \
    && curl -sSL $RINETD_URL | tar xz --strip 1 \
    && ./configure --prefix=/usr --sysconfdir=/etc/rinetd \
    && make install \
    && cd .. \
    && rm -r rinetd \
	&& chmod +x /usr/local/bin/socks5 \
    && apk del build-base curl tar

COPY kcptun_config.json /etc

# install supervisor
RUN apk --update add --no-cache supervisor \
    && mkdir -p /etc/supervisord.d
COPY supervisord.conf /etc
COPY process.conf /etc/supervisord.d
STOPSIGNAL SIGTERM
CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
