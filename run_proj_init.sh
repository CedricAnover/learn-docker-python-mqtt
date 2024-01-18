#!/bin/bash

$( docker compose down )

messages_dir="$PWD/messages"
mosquitto_dir="$PWD/mosquitto"

echo "Removing $messages_dir ..."
$(rm -rf "$messages_dir")
echo "Done"

echo "Removing $mosquitto_dir ..."
$(sudo rm -rf "$mosquitto_dir")
echo "Done"
echo

create_dir() {
    
    dir="$1"
    
    if [ -d "$dir" ]; then
        echo "$dir already exists"
    else
        echo "$dir does not exist, creating..."
        mkdir -p "$dir"
        echo "$dir created"
    fi
    echo
}

create_dir $messages_dir
create_dir $mosquitto_dir
create_dir "$mosquitto_dir/config"
create_dir "$mosquitto_dir/data"
create_dir "$mosquitto_dir/log"

echo "Generating Mosquitto Configuration File ..."
# Create the Mosquitto Configuration File
cat <<EOF > "$mosquitto_dir/config/mosquitto.conf"
allow_anonymous true
listener 1883

persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
EOF

# Run Docker Compose
echo "Running Docker Compose"
"$( docker compose up --build -d )"
