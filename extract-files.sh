#!/bin/sh

BASE=../../../vendor/pantech/ef46l/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  adb pull $FILE $BASE/$FILE
done

./setup-makefiles.sh