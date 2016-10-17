#!/bin/bash

CONFD_OPTIONS=${CONFD_OPTIONS:-"-onetime -backend=env"}
/usr/local/bin/confd -log-level=debug $CONFD_OPTIONS -confdir=$PWD/confd

command=$1
shift
case $command in
    bash)
	exec /bin/bash
	;;
    *)
	exec /usr/sbin/nginx -g "daemon off;"
        ;;
esac
	
