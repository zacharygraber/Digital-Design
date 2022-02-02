#!/usr/bin/env python3

import paho.mqtt.client as mqtt
import adxl343
import lps331
import time

# White Bar Code Label Number on Each Raspberry Pi
sensor_id = 999491
lps_sens = lps331.lps331(1)
adxl_sens = adxl343.adxl343()
temperature = -99
pressure = -99
x_acceleration = -99
y_acceleration = -99
z_acceleration = -99

def on_message(client, userdata, message):
    print("topic:", message.topic)
    print("message:", message.payload.decode('UTF-8'))

def on_connect(client,userdata,flags,rc):
    pass
    
client = mqtt.Client()
client.on_message=on_message
client.on_connect=on_connect
client.connect("pivot.iuiot.org")
client.loop_start()
while(1):
    temperature = lps_sens.read_temperature()
    pressure = lps_sens.read_pressure()
    x_acceleration = adxl_sens.read_x_axis()
    y_acceleration = adxl_sens.read_y_axis()
    z_acceleration = adxl_sens.read_z_axis()


    print("Publish Temperature, Pressure, and Accelerometer Data")
    client.publish(f"sensors/{sensor_id}/temperature",f"{temperature}")
    client.publish(f"sensors/{sensor_id}/pressure",f"{pressure}")
    client.publish(f"sensors/{sensor_id}/accel/x",f"{x_acceleration}")
    client.publish(f"sensors/{sensor_id}/accel/y",f"{y_acceleration}")
    client.publish(f"sensors/{sensor_id}/accel/z",f"{z_acceleration}")
    time.sleep(5)
