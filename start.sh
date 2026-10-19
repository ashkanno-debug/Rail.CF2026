#!/bin/sh

/usr/local/x-ui/x-ui &

sleep 5

/usr/local/bin/cloudflared tunnel --url http://localhost:2097 --no-autoupdate --protocol http2 &

/usr/local/bin/cloudflared tunnel --url http://localhost:2098 --no-autoupdate --protocol http2
