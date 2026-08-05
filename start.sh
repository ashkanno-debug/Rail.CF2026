#!/bin/sh

/usr/local/x-ui/x-ui &

sleep 10

/usr/local/bin/cloudflared tunnel --url http://localhost:2053 --no-autoupdate --protocol http2 &

/usr/local/bin/cloudflared tunnel --url http://localhost:8080 --no-autoupdate --protocol http2
