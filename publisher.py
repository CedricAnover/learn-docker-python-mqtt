import sys
import time
import paho.mqtt.client as paho


TOPIC = sys.argv[1]
MQTT_HOST = 'mqtt'
MQTT_PORT = 1883

client = paho.Client()
client.connect(MQTT_HOST, MQTT_PORT)


if __name__ == "__main__":
    for i in range(10):
        time.sleep(1.05)
        client.publish(TOPIC, f"Iteration {i} from Publisher.")