ARG VERSION
FROM caddy:${VERSION}-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav

FROM caddy:${VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy