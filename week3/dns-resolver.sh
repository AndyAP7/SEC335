#!/bin/bash

network=$1
dns=$2


for i in $(seq 1 254); 
do 
	nslookup $network.$i $dns | grep "name ="
done
