#!/bin/bash

SESSION_NAME="development"

# Create a new Tmux session
tmux -u new-session -d -s $SESSION_NAME

#This script requires autojump to be installed and alias added as 'j'

# Create windows with specified names and execute commands in each window
tmux -u new-window -t $SESSION_NAME:1 -n "hot"
tmux send-keys -t $SESSION_NAME:1 'nvim notes.txt' C-m

tmux -u new-window -t $SESSION_NAME:2 -n "frontend"
tmux send-keys -t $SESSION_NAME:2 'j project-frontend && nvim .' C-m

tmux -u new-window -t $SESSION_NAME:3 -n "backend"
tmux send-keys -t $SESSION_NAME:3 'j project-backend && nvim .' C-m

tmux -u new-window -t $SESSION_NAME:4 -n "mysql"
tmux send-keys -t $SESSION_NAME:4 'PGPASSWORD=<password> && psql -h <server> -U <user> <db>' C-m

tmux -u new-window -t $SESSION_NAME:5 -n "server"
tmux send-keys -t $SESSION_NAME:5 'ssh -i ~/.ssh/<key-name>.pem ubuntu@<ip-address>' C-m

# Attach to the newly created session
tmux -u attach-session -t $SESSION_NAME
