ARG VERSION
FROM caddy:${VERSION} AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy