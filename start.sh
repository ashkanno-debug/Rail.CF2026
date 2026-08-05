#!/bin/sh

# اجرای پنل 3x-ui در پس‌زمینه
/usr/local/x-ui/x-ui &

# چند ثانیه صبر میکنیم تا پنل کامل بالا بیاد
sleep 5

# اجرای cloudflared برای ایجاد تونل به پنل (پورت 2053)
/usr/local/bin/cloudflared tunnel --url http://localhost:2053 --no-autoupdate --protocol http2 &

# اجرای cloudflared برای ایجاد تونل به اینباندهای کلاینت (پورت 8080)
/usr/local/bin/cloudflared tunnel --url http://localhost:8080 --no-autoupdate --protocol http2
