#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# This software is ...
# Copyright (c) 2022 Joseph Turner (aka Tearran) & contributors

import os
import time
import json
import bme680
    
# Set working dir
try:
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
except:
    print("Failed to change to Working Directory")

# INI sensor
try:
    sensor = bme680.BME680(bme680.I2C_ADDR_PRIMARY)
except (RuntimeError, IOError):
    sensor = bme680.BME680(bme680.I2C_ADDR_SECONDARY)

sensor.set_humidity_oversample(bme680.OS_2X)
sensor.set_pressure_oversample(bme680.OS_4X)
sensor.set_temperature_oversample(bme680.OS_8X)
sensor.set_filter(bme680.FILTER_SIZE_3)
sensor.set_gas_status(bme680.ENABLE_GAS_MEAS)

sensor.set_gas_heater_temperature(320)
sensor.set_gas_heater_duration(150)
sensor.select_gas_heater_profile(0)

while True:
    if sensor.get_sensor_data():
        output = {
            'temperature': sensor.data.temperature,
            'pressure': sensor.data.pressure,
            'humidity': sensor.data.humidity,
            'gas_resistance': sensor.data.gas_resistance,
            'heat_stable': sensor.data.heat_stable,
            'gas_index': sensor.data.gas_index
        }

        with open('/run/user/1000/its/bmp680.json', 'w') as f:
            json.dump(output, f)
    #print("sleeping 1")
    time.sleep(1)
    