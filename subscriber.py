import sys
import paho.mqtt.client as paho


TOPIC = sys.argv[1]
MQTT_HOST = 'mqtt'
MQTT_PORT = 1883

client = paho.Client()
client.connect(MQTT_HOST, MQTT_PORT)

def on_message(client, userdata, message):
    msg = message.payload.decode()

    with open("/messages/messages.txt", 'a') as file:
        file.write(f"{msg}\n")


if __name__ == "__main__":
    client.subscribe(TOPIC)
    client.on_message = on_message
    client.loop_forever()
