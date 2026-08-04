#!/bin/sh

# اجرای پنل 3x-ui در پس‌زمینه
/usr/local/x-ui/x-ui &

# صبر برای بالا اومدن پنل
sleep 5

# تونل برای پنل (پورت 2053)
/usr/local/bin/cloudflared tunnel --url http://localhost:2053 --no-autoupdate --protocol http2 &

# تونل برای اینباندهایی که توی پنل میسازی (پورت 8080)
/usr/local/bin/cloudflared tunnel --url http://localhost:8080 --no-autoupdate --protocol http2
