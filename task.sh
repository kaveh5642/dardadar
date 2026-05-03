#!/bin/bash
# کشتن پروسه‌های قبلی
pkill -9 gost

# اجرای تانل با پروتکل TLS (امن‌تر و پایدارتر)
# پارامتر secure=false برای این است که به گواهی SSL کداسپیس گیر ندهد
nohup ./gost -L rtcp://:2080/127.0.0.1:2080 -F relay+tls://upgraded-halibut-x5g499jx75gjf9xrp-8080.app.github.dev:8080?secure=false > gost.log 2>&1 &

echo "Gost TLS started..."
