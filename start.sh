#!/bin/sh

# اجرای X-UI در پس‌زمینه
/usr/local/x-ui/x-ui &

# صبر برای بالا اومدن
sleep 5

# اجرای cloudflared
/usr/local/bin/cloudflared tunnel --url http://localhost:8080 --no-autoupdate --protocol http2
