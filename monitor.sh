#!/bin/bash

service=$1

if [ -z ${service} ]; then 
    echo "You must pass a service:"
    echo "./monitor.sh web"
    exit;
fi

sessionname="monitor-$service"
setdockerhost="export DOCKER_HOST=192.168.99.201; "
watch="$setdockerhost; watch -d -n 0.5 "
servicels="$watch docker service ls"
serviceinspect="$watch docker service inspect $service"
serviceps="$watch docker service ps $service"

tmux kill-session -t $sessionname

tmux set-option remain-on-exit on


tmux new-session -d -s $sessionname 
# tmux send-keys "$serviceinspect" C-m
# tmux split-window -p 50 -h
tmux send-keys "$servicels" C-m

tmux split-window -p 75 -v 
tmux send-keys "$serviceps" C-m

tmux split-window -p 30 -v 
# tmux select-pane -t 2
tmux send-keys "$setdockerhost; clear" C-m



tmux -2 attach-session -d -t $sessionname 
