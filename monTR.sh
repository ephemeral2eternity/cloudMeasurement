#!/bin/bash
host=$(hostname)
srvs=( "az01:cache-01.cloudapp.net"
       "az02:cache-02.cloudapp.net"
       "az03:cache-03.cloudapp.net"
       "aws01:54.152.213.238"
       "gc01:107.167.191.63" )

for n in {1..20}
do
	for srv in "${srvs[@]}"
	do
		k="${srv%%:*}"
		v="${srv##*:}"
		echo "$k = $v"
		echo "The $n time to traceroute for from $host to the server $v"
		ts=$(date +%s)
		(date;traceroute -m 60 "$v") > ~/log/"$host"_"$k"_"$ts"_TR.log
	done
done
