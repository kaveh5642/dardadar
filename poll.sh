#!/bin/bash
BRANCH="main"
echo "Git-Polling: Force-Sync Mode Active..."

while true; do
    # ۱. گرفتن آخرین وضعیت بدون اعمال روی فایل‌ها
    git fetch origin $BRANCH &> /dev/null
    
    LOCAL=$(git rev-parse HEAD)
    REMOTE=$(git rev-parse @{u})

    if [ "$LOCAL" != "$REMOTE" ]; then
        echo "New task detected. Resetting to remote..."
        
        # ۲. پاکسازی کامل: هر چی روی سرور هست رو پاک کن و شبیه گیت‌هاب شو
        git reset --hard origin/$BRANCH &> /dev/null
        
        # ۳. بررسی اینکه آیا دستور جدیدی در فایل هست یا نه
        if [ -s "task.sh" ]; then
            TIMESTAMP=$(date +%Y%m%d_%H%M%S)
            echo "Executing: task.sh"
            
            # اجرا و ثبت لاگ
            bash task.sh > "results/output_$TIMESTAMP.txt" 2>&1
            
            # ۴. آماده‌سازی برای آپلود (خالی کردن فایل دستور)
            > task.sh
            git add .
            git commit -m "Result: $TIMESTAMP [skip ci]" &> /dev/null
            
            # ۵. ارسال با قدرت (Force Push) برای جلوگیری از خطای Non-fast-forward
            git push origin $BRANCH -f
            echo "Task finished. Results pushed successfully."
        fi
    fi
    sleep 15
done
