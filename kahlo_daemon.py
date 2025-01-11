import logging
import logging.config
from datetime import datetime, time
from time import sleep
from typing import List
from pathlib import Path

import psutil as psutil
from adafruit_dht import DHT11
import RPi.GPIO as GPIO

from database import TankUpdate, session_scope

# Sleep time
SLEEP = 180

# Temp sensors
LEFT_SIDE_SENSOR_PIN = 22                               # GPIO PIN
RIGHT_SIDE_SENSOR_PIN = 23                              # GPIO PIN
SENSORS = [LEFT_SIDE_SENSOR_PIN, RIGHT_SIDE_SENSOR_PIN]
# Relay
RELAY_GPIO = 17
# Configuration
DAY_TIME = [time(7, 00), time(20, 00)]                  # Daytime range, uses Eastern time
DAY_TIME_RANGE = [86, 88]                               # Not inclusive range()
NIGHT_TIME_RANGE = [70, 73]                             # Not inclusive range()
# Reload fault count
FAULT_MAX = 2


class Relay:
    """Tiny wrapper to make it easier to interact with the relay"""
    def __init__(self, log: logging.Logger):
        self.gpio_pin = RELAY_GPIO
        self.log = log
        self.gpio = GPIO
        self._set_daytime()
        self._set_range()
        self.setup()

    def _set_daytime(self):
        """Check if the current time is between the range of daytime"""
        current_time = datetime.now().time()
        if DAY_TIME[0] <= current_time <= DAY_TIME[1]:
            self.day_time = True
        else:
            self.day_time = False

    def _set_range(self):
        """Set the temperature range based on time cycle"""
        if self.day_time:
            self.temp_range = DAY_TIME_RANGE
        else:
            self.temp_range = NIGHT_TIME_RANGE

    def update(self, left_temp: int) -> None:
        """Update the relays temp range, then check if the temp is within the available range"""
        self.log.debug("Updating relay data")
        self._set_daytime()
        self._set_range()

        self.log.debug(f"Left temp: {left_temp}")

        if left_temp == -1:
            self.log.error("Could not get updated temps. Please check both sensors. "
                           f"The Relay will remain in {self.is_on()} status")

        elif left_temp in range(*self.temp_range):
            self.log.debug("No change to relay, returning.")

        elif left_temp <= self.temp_range[0]:
            if self.is_on() is False:
                self.log.info(f"Left temp at: {self.temp_range[0]}")
                self.log.debug("Turning relay on...")
                self.on()
                self.log.info(f"Relay is on: {'Yes' if self.is_on() else 'No'}")
            else:
                self.log.debug("Relay already on, returning")

        elif left_temp >= self.temp_range[1]:
            if self.is_on():
                self.log.info(f"Left temp at: {self.temp_range[1]}")
                self.log.debug("Turning relay off...")
                self.off()
                self.log.info(f"Relay is off: {'No' if self.is_on() else 'Yes'}")
            else:
                self.log.debug("Relay already off, returning")

    def setup(self) -> None:
        self.gpio.setmode(self.gpio.BCM)
        self.gpio.setup(self.gpio_pin, self.gpio.OUT)

    def on(self) -> None:
        self.gpio.output(self.gpio_pin, True)

    def off(self) -> None:
        self.gpio.output(self.gpio_pin, False)

    def is_on(self) -> bool:
        return True if self.gpio.input(self.gpio_pin) else False


class TempSensor(DHT11):
    """Class handles displaying the data from each temperature sensor"""

    def __init__(self, pin: int, side: str, lamp_status: bool = False):
        """
        Keep track of the current readings of the sensor.

        Parameters
        ----------
        pin: int
            The pin location on the board for the sensor
        """
        super().__init__(pin)
        self.pin = pin
        self.side = side
        self.ex_temperature = 0.0
        self.ex_humidity = 0.0
        self.success_read = False
        self.lamp_status = lamp_status
        self.update_time = None

    def __str__(self):
        return f"Succ: {self.success_read} Side: {self.side} Temp: {self.ex_temperature} Humidity: {self.ex_humidity}"

    def __repr__(self):
        return f"<Device Side: {self.side} | Pin location: {self.pin}>"

    def update(self, temperature: int = -1, humidity: int = -1, status: bool = True, lamp_status: bool = False):
        self.update_time = datetime.now().strftime("%m-%d-%y %H:%M:%S")
        if status:
            try:
                self.ex_temperature = self.temperature
                self.ex_humidity = self.humidity
                self.success_read = status
                self.lamp_status = lamp_status
            except RuntimeError:
                raise
        else:
            self.ex_temperature = temperature
            self.ex_humidity = humidity
            self.success_read = status
            self.lamp_status = lamp_status

    @property
    def to_dict(self):
        return {
            "update": self.update_time,
            "successful_read": self.success_read,
            "sensor_side": self.side,
            "sensor_temp": self.ex_temperature,
            "sensor_humidity": self.ex_humidity,
            "heat_lamp_on": self.lamp_status
        }

    @property
    def ex_temperature(self):
        return f"{self._temperature:.2f}"

    @ex_temperature.setter
    def ex_temperature(self, value: -1):
        # Convert C to F
        if value > 0:
            self._temperature = value * (9 / 5) + 32
        else:
            self._temperature = -1

    @property
    def ex_humidity(self):
        return f"%{self._humidity:.2f}"

    @ex_humidity.setter
    def ex_humidity(self, value: int):
        if value > 0:
            self._humidity = value
        else:
            self._humidity = -1


def _get_sensors(log: logging.Logger) -> List[TempSensor]:
    """
    Function to return the sensors. In case they get disconnected, there has to be a
    way to re-create the sensor objects. The first sensor in the list will be the
    left side.

    Returns
    -------
    list:
        List of temperature sensors
    """

    sensors = []
    sides = ["left", "right"]
    log.debug("Fetching sensors")
    for index, sensor in enumerate(SENSORS):
        print(f"Init: {sides[index]} Pin: {sensor}")
        sensors.append(TempSensor(sensor, sides[index]))

    log.debug(f"Fetched sensors {sensors}")
    return sensors


def main() -> bool:
    # Get logger
    global initial_start
    log = logging.getLogger("root")

    # Fetch sensors
    sensors = _get_sensors(log)

    # Setup relay
    relay = Relay(log=log)

    # Control loop and reloads
    fault_count = 0
    running = True

    while running:
        # Quickly start after boot
        if initial_start:
            sleep(10)
            initial_start = False
        else:
            sleep(SLEEP)

        # Update sensor data
        for sensor in sensors:
            try:
                log.debug(f"Updating {sensor.side} sensor")
                sensor.update(lamp_status=relay.is_on())
                log.debug(f"{sensor.side} side temperature sensor updated")
            except RuntimeError as error:
                log.error(error, exc_info=True)
                # If sensor failed to read, then update with defaults
                sensor.update(status=False, lamp_status=relay.is_on())
            except Exception as error:
                log.error(error, exc_info=True)
                log.debug("Attempting to reset script")
                return True

        # Update relay if we got good reads
        succ_update = True
        for sensor in sensors:
            if not sensor.success_read:
                succ_update = False

        # Increment fault count if can't read sensors
        if not succ_update:
            fault_count += 1
            relay.update(-1)
        else:
            for sensor in sensors:
                if sensor.side == 'left':
                    relay.update(sensor.temperature)

        # If faults get too high, reload data
        if fault_count >= FAULT_MAX:
            log.debug("Fault count exceeded, reloading sensors...")
            return True

        # Update database
        with session_scope() as session:
            for sensor in sensors:
                session.add(TankUpdate(**sensor.to_dict))


if __name__ == "__main__":
    log_path = Path(__file__).parent.resolve() / "logs/logging.conf"
    print(log_path)
    print(dir(log_path))
    logging.config.fileConfig(log_path)
    initial_start = True
    try:
        loop = True
        while loop:
            loop = main()
            GPIO.cleanup()
            print("Reloading sensors...")
            sleep(5)
            for proc in psutil.process_iter():
                if proc.name() == 'libgpiod_pulsein' or proc.name() == 'libgpiod_pulsei':
                    proc.kill()
            sleep(5)
    except KeyboardInterrupt:
        GPIO.cleanup()
