#!/bin/bash

ALL_HOSTS=(10.173.0.40 10.162.211.112 10.172.252.1 10.172.255.76)



case  $1  in
        ssh)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
			ssh root@${ALL_HOSTS[$i-1]} "mkdir .ssh;chmod 0700 .ssh"
			scp ~/.ssh/id_rsa.pub root@${ALL_HOSTS[$i-1]}:.ssh/id_rsa.pub
		done
                ;;
	remote)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
			ssh root@${ALL_HOSTS[$i-1]} "touch /root/.ssh/authorized_keys"
			ssh root@${ALL_HOSTS[$i-1]} "chmod 600 ~/.ssh/authorized_keys"
			ssh root@${ALL_HOSTS[$i-1]} "cat /root/.ssh/id_rsa.pub  >> /root/.ssh/authorized_keys"
		done
		;;
	cmd)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
		#	ssh root@${ALL_HOSTS[$i-1]} 
		done
        *)
                echo $ Usage: {mongo1|mongo2|web1|web2} 
                exit 1
esac
