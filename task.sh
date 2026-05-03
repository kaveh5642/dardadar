#!/bin/bash
# کشتن هرچی گوست از قبل مونده
pkill -9 gost

# نکته کلیدی: اتصال به پورت 443 با پروتکل wss
# چون گیت‌هاب خودش ترافیک 443 رو میفرسته روی 8080 کداسپیس تو
nohup ./gost -L rtcp://:2080/127.0.0.1:2080 -F relay+wss://upgraded-halibut-x5g499jx75gjf9xrp-8080.app.github.dev:443?host=raw.githubusercontent.com > gost.log 2>&1 &

echo "Connecting to tunnel via port 443..."
