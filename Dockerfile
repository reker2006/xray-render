FROM ghcr.io/xtls/xray-core:latest AS core

FROM alpine:3.22
RUN apk add --no-cache ca-certificates tzdata \
    && mkdir -p /usr/local/share/xray /usr/local/etc/xray
COPY --from=core /usr/local/bin/xray /usr/local/bin/xray
COPY --from=core /usr/local/share/xray/geoip.dat /usr/local/share/xray/geoip.dat
COPY --from=core /usr/local/share/xray/geosite.dat /usr/local/share/xray/geosite.dat
COPY config.json /usr/local/etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]
