#!/bin/sh
# Render assigns the listen port via the $PORT env var; rewrite the config to match before starting.
sed -i "s/\"port\": 3000/\"port\": ${PORT:-3000}/" /usr/local/etc/xray/config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
