#!/bin/bash

ALL_HOSTS=(10.173.0.40 10.162.211.112 10.172.252.1 10.172.255.76)



case  $1  in
        remote)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
			rsync --delete -av $2 root@${ALL_HOSTS[$i-1]}:$3
		done
                ;;
esac
