#!/bin/bash

# ۱. دانلود Gost در سرور ایران
if [ ! -f "./gost" ]; then
    curl -sL https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost_2.11.1_linux_amd64.tar.gz | tar xz
    mv gost_2.11.1_linux_amd64/gost .
    chmod +x gost
fi

# ۲. کشتن پروسه‌های قبلی
pkill -9 gost

# ۳. اجرای در پس‌زمینه (اضافه شدن nohup و &)
nohup ./gost -L rtcp://:2080/127.0.0.1:2080 -F relay+wss://upgraded-halibut-x5g499jx75gjf9xrp-8080.app.github.dev:8080?host=raw.githubusercontent.com > /dev/null 2>&1 &

echo "Gost is running in background..."
