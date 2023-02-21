# BME680 Sensor Data Logger

This software logs sensor data from a BME680 sensor and saves it to a JSON file.

## Requirements

- Python 3
- bme680 library (install with `python3 -m pip install bme680`)

## Usage

1. Connect the BME680 sensor to your device.
2. Run the `bme680_logger.py` script using Python 3.
3. The sensor data will be logged to a JSON file (`/run/user/1000/its/bmp680.json`) every second.


run is an example of a Bash script that sets up a local server to display sensor data from a BME680 sensor.


```bash
cat /run/user/1000/its/bmp680.json
```
http://localhost:8000 

This will show the most recent JSON object in the `bmp680.json` file in a formatted way.

## Contributing

Contributions are welcome. If you find a bug or want to suggest an improvement, please open an issue or a pull request on GitHub.


## License

This script is licensed under the MIT License. See the `LICENSE` file for details.
