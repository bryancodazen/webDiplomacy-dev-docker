#!/bin/bash

while true; do
    wget 'http://localhost/gamemaster.php?gameMasterSecret=midas123' -O /dev/null >> gamemaster.log 2>&1
    sleep 1
done
