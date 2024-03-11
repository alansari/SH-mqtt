FROM debian:bookworm

# Install Docker & MQTT
RUN apt-get update && apt-get install -y \
    docker.io \
    mosquitto-clients \
    && rm -rf /var/lib/apt/lists/*

COPY control-mqtt.sh /control-mqtt.sh

RUN chmod +x /subscribe-mqtt.sh

ENTRYPOINT ["/subscribe-mqtt.sh"]
