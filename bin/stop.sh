#!/bin/bash
a=$(ps aux | grep redis-server | grep -v grep | awk '{print $2}'| head -1)
kill -9 ${a}

while [$(ps aux | grep redis-server | grep -v grep | wc -l) -gt 0]
do
  b=$(ps aux | grep redis-server | grep -v grep | awk '{print $2}' | head -1)
  if [${a} -gt ${b}]; then
    sleep 1
  else
    kill -9 ${b}
    a=${b}
  fi
done
echo "stop ok"