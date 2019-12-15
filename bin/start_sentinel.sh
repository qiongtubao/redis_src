#!/bin/bash
function run() {
  cd $1
  nohup ../redis-server ./sentinel.conf --sentinel &
  cd ../
}


echo "start sentinel"