from datetime import datetime
from time import sleep

import board
from sqlalchemy import desc
import adafruit_dht

from database import TankUpdate, session_scope


def main():

    first_data = TankUpdate(
        update_date = datetime.now(),
        left_side_temp = 99.2,
        left_side_humidity = 100.0,
        right_side_temp = 79.1,
        right_side_humidity = 55.0,
        heat_lamp_on = True)

    with session_scope() as session:
        session.add(first_data)

    with session_scope() as session:
        updates = session.query(TankUpdate).order_by(desc(TankUpdate.update_date)).limit(1)
        for update in updates:
            print(update)

    dhtDevice = adafruit_dht.DHT22(board.D5)

    while True:
        try:
            # Print the values to the serial port
            temperature_c = dhtDevice.temperature
            temperature_f = temperature_c * (9 / 5) + 32
            humidity = dhtDevice.humidity
            print(
                "Temp: {:.1f} F / {:.1f} C    Humidity: {}% ".format(
                    temperature_f, temperature_c, humidity
                )
            )

        except RuntimeError as error:
            # Errors happen fairly often, DHT's are hard to read, just keep going
            print(error.args[0])
            sleep(2.0)
            continue
        except Exception as error:
            dhtDevice.exit()
            raise error

        sleep(2.0)


if __name__ == "__main__":
    main()
