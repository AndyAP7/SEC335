#!/bin/bash

hfile=$1
pfile=$2

if [ ! -f "$hfile" ]; then
        echo "File not found" 
        exit 1
fi
echo "host, port, status"

for host in (cat $hfile) do
    for port in $(cat $pfile); do 
            timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null 
            && status="open port" || status="closed port"
            echo "$host, $port, $status"
      done
done
