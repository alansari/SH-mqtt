#!/bin/bash

BROKER_ADDRESS=${BROKER_ADDRESS:-"localhost"}
TOPIC=${TOPIC:-"docker/control/#"}

# Subscribe to the topic and listen for messages
mosquitto_sub -h $BROKER_ADDRESS -t $TOPIC | while read -r MESSAGE
do
  CONTAINER_NAME=$(echo $MESSAGE | cut -d ' ' -f 1)
  ACTION=$(echo $MESSAGE | cut -d ' ' -f 2)

  if [ "$ACTION" == "pause" ]; then
    docker pause $CONTAINER_NAME
  elif [ "$ACTION" == "unpause" ]; then
    docker unpause $CONTAINER_NAME
  fi
done
