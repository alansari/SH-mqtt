# SH-mqtt
Pause and unpause steam headless (or any other) docker based on mqtt events
Meant to be run with Home Assistant companion app on mobile to send required mqtt events

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e BROKER_ADDRESS="localhost:port" \
  -e TOPIC="docker/control/+" \
  SH-mqtt
