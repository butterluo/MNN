#!/bin/bash
DIR=MNN

/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./libMNN.so /data/local/tmp/$DIR/libMNN.so
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./libMNN_Express.so /data/local/tmp/$DIR/libMNN_Express.so
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./MNNV2Basic.out /data/local/tmp/$DIR/MNNV2Basic.out
/mnt/e/Andr/Sdk/platform-tools/adb.exe shell "cd /data/local/tmp/$DIR && rm -r output"
/mnt/e/Andr/Sdk/platform-tools/adb.exe shell "cd /data/local/tmp/$DIR && mkdir output"
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./testModel.out /data/local/tmp/$DIR/testModel.out
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./testModelWithDescrisbe.out /data/local/tmp/$DIR/testModelWithDescrisbe.out
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./timeProfile.out /data/local/tmp/$DIR/timeProfile.out
/mnt/e/Andr/Sdk/platform-tools/adb.exe push ./run_test.out /data/local/tmp/$DIR/run_test.out
/mnt/e/Andr/Sdk/platform-tools/adb.exe shell "chmod 777 -R /data/local/tmp/MNN/*"