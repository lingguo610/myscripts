#!/bin/bash
rm -f llf*
str=`ps aux | grep "/root/llf" | grep -v grep | awk '{print $2}'`
cp /proc/$str/root/unix_log/business_0/llf_* .

