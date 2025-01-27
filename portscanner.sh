#!/bin/bash

hostfile=$1
portfile=$2

if [ ! -f "Shostfile" ]; then
        echo "File not found" 
        exit 1
fi
echo "host, port,status"

for host in (cat $hostfile) do
    for port in $(cat $portfile); do 
            timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && status="open" || status="closed
            echo "$host, $port, $status"
      done
done
