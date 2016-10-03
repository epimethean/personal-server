#!/bin/bash
if [ "$1" = "" ]; then
  echo "Usage: kshell <pod>"
  exit 1
fi
COLUMNS=`tput cols`
LINES=`tput lines`
TERM=xterm
NAME=$(kubectl get pods | grep $1 | grep Running | awk '{ print $1 }')
if [ ! -z $2 ]; then
  CONTAINER="-c $2"
fi

kubectl exec -i -t $NAME $CONTAINER env COLUMNS=$COLUMNS LINES=$LINES TERM=$TERM bash
