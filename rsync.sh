#!/bin/bash

ALL_HOSTS=(10.173.0.40 10.162.211.112 10.172.252.1 10.172.255.76)

WEB_HOSTS=(10.172.252.1 10.172.255.76)

TOMCAT_DIR=/var/production/apache-tomcat-7.0.55/
WEBAPPS_DIR=$TOMCAT_DIR/webapps/
#ALL_HOSTS=(10.162.211.112 10.172.252.1 10.172.255.76)


case  $1  in
        remote)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
			echo "RSYNC ${ALL_HOSTS[$i-1]}"
			rsync --delete -av $2 root@${ALL_HOSTS[$i-1]}:$3
		done
                ;;
	deploy)
		count=${#ALL_HOSTS[@]}
		for i in `seq 1 $count`
		do
			rsync -av /var/production/wars/target root@${ALL_HOSTS[$i-1]}:/var/production/wars/
		done
                ;;
	deploy_web)
		count=${#WEB_HOSTS[@]}

		for i in `seq 1 $count`
		do
			rsync -av /var/production/wars/target/perfect.war root@${WEB_HOSTS[$i-1]}:$WEBAPPS_DIR
		done
                ;;
esac
