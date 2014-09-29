#!/bin/bash

case  $1  in
        mongo1)
                ssh 10.173.0.40
		echo 1QAZxsw2
                ;;
        mongo2)
                ssh 10.162.211.112
                ;;
        web1)
                ssh 10.172.252.1
                ;;
        web2)
                ssh 10.172.255.76
                ;;
        *)
                echo $ Usage: {mongo1|mongo2|web1|web2} 
                exit 1
esac
