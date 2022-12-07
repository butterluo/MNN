#!/bin/bash
/mnt/e/Andr/Sdk/platform-tools/adb.exe shell "cd /data/local/tmp/MNN&&export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH&& $1 $2 $3 $4 $5 $6 $7 $8 $9"
