#!/bin/bash
host=$(hostname)
srvs=( "az01:cache-01.cloudapp.net"
       "az02:cache-02.cloudapp.net"
       "az03:cache-03.cloudapp.net"
       "az04:cache-04.cloudapp.net"
       "az05:cache-05.cloudapp.net"
       "az07:cache-07.cloudapp.net"
       "az08:cache-08.cloudapp.net"
       "az09:cache-09.cloudapp.net"
       "az10:cache-010.cloudapp.net"
       "aws01:54.152.213.238"
       "aws02:54.186.168.77"
       "aws03:54.153.43.107"
       "aws04:54.77.113.86"
       "aws05:54.169.179.58"
       "aws06:54.64.91.44"
       "aws07:54.153.153.121"
       "aws08:54.94.144.78"
       "gc01:107.167.191.63"
       "gc02:107.167.182.111"
       "gc03:104.155.211.19"
       "gc04:104.155.194.20"
       "gc05:104.155.229.210"
       "gc06:104.155.225.107"
       "gc07:130.211.63.102"
       "gc08:130.211.95.77"
       "gc09:146.148.115.155"
       "gc10:104.155.4.67"
       "gc11:130.211.118.29"
       "gc12:146.148.89.8"
       "gc13:130.211.153.45"
       "gc14:104.154.61.126"
       "gc15:130.211.115.69"
       "gc16:104.154.54.212")

for n in {1..200}
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
