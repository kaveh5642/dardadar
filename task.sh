#!/bin/bash
pkill -9 gost

# استفاده از wss برای عبور از پروکسیِ خودِ گیت‌هاب
nohup ./gost -L rtcp://:2080/127.0.0.1:2080 -F relay+wss://upgraded-halibut-x5g499jx75gjf9xrp-8080.app.github.dev:443?host=raw.githubusercontent.com > gost.log 2>&1 &

echo "Gost WSS Tunnel started..."
