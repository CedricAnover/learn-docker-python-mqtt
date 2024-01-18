# learn-docker-python-mqtt
Just trying to play around Dockerfiles, Docker Compose, Python Paho Mqtt, and Eclipse Mosquitto Docker Image.

## To run and initialize the project do
```bash
$ chmod u+x run_proj_init.sh
$ ./run_proj_init.sh
```

## Play with MQTT with Debian Containers

### Build the Debian Image

```bash
docker build -t debian-machine -f Dockerfile.vm .
```

### Creating Pub and Sub Debian Containers

Create 2 Terminal Sessions and execute:

```bash
docker run -it --rm --network=mqtt-net debian-machine
```

In the Sub Machine, execute the command:

```bash
mosquitto_sub -h mqtt -p 1883 -t test
```

In the Pub Machine, execute the command:

```bash
mosquitto_pub -h mqtt -p 1883 -t test -m "Hello from the other Machine"
```
