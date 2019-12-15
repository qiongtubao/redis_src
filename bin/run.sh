#!/bin/bash

function run() {
  cd $1
  rm -rf nohup.out
  nohup ../redis-server ./redis.conf &
  cd ../
}

run "master"
run "slave"

while [ $(ps aux | grep redis-server | grep -v grep | wc -l) -gt 2 ]
do
   sleep 1
done
sleep 1
echo "ok start"