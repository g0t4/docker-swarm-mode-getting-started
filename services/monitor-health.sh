#!/bin/bash

stack=$1

if [ -z ${stack} ]; then 
    echo "You must pass a stack:"
    echo "./monitor.sh web"
    exit;
fi

sessionname="monitor-$stack"
setdockerhost="export DOCKER_HOST=192.168.99.201; "
watch="$setdockerhost; watch -d -n 0.5 "
stackps="$watch docker stack ps $stack"
dockerps="$watch docker ps -f name=$stack --format \'table {{.ID}}\\\\t{{.Names}}\\\\t{{.RunningFor}}\\\\t{{.Status}}\'"
dockerinspect="$watch \"docker inspect \\\$(docker ps -f name=$stack -q) | jq '.[].State'\""

tmux kill-session -t $sessionname

tmux set-option remain-on-exit on
tmux set-option status on 

tmux new-session -d -s $sessionname 
tmux split-window -p 40 -h 

# Show inspect of container and grab State with detailed Health State - you're only going to fit one container on screen
tmux select-pane -t 1 
tmux send-keys "$dockerinspect" C-m

# Show docker stack ps for tasks - only good to see change in tasks - right now no health information is reflected
tmux select-pane -t 0 
tmux send-keys "$stackps" C-m

# Show docker ps for health status 
tmux split-window -v -p 60
tmux send-keys "$dockerps" C-m


# Window for typing commands lower left
tmux split-window -v -p 60 
tmux send-keys "$setdockerhost; clear" C-m

tmux -2 attach-session -d -t $sessionname 
