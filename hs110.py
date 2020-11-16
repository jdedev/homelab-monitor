from pyHS100 import SmartPlug
from influxdb import InfluxDBClient
from time import sleep
import datetime
import platform
import socket

plug = SmartPlug("10.0.1.13")
client = InfluxDBClient(database="hs110")
now = datetime.datetime.now()
theMonth = now.month

while True:
#        node = platform.node()
        node = socket.getfqdn("10.0.1.13")
        power = plug.get_emeter_realtime()['power']
        monthly_power = plug.get_emeter_monthly()[theMonth]

        client.write_points([{
                "measurement": "power",

                "fields": {
                        "host" : node,
                        "month": theMonth,
                        "current_power": power,
                        "monthly_power": monthly_power
                }
        }])
        sleep(10)
