#!/bin/bash

# Set the path to your Erlang release
RELEASE_PATH="/home/ubuntu/micro_service_infra"

# Set the name of your release
RELEASE_NAME="micro_service_infra"

# Change to the release directory
cd $RELEASE_PATH

# Start the release in daemon mode
erl -pa ebin -sname micro_service_infra -setcookie a -noinput -detached

#Wait for a moment to ensure the daemon has started
sleep 5

# Check if the daemon is running
if pgrep -f "$RELEASE_NAME" > /dev/null
then
    echo "Erlang release started successfully in daemon mode."
    exit 0
else
    echo "Failed to start Erlang release."
    exit 1
fi
