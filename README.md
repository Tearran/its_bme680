# its_bmp680.py

`its_bmp680.py` is a Python script that interfaces with the BME680 environmental sensor to read temperature, pressure, humidity, and gas resistance data. The script runs continuously and writes the sensor data to a JSON file in a ramdisk for later use.

## Requirements

To use `its_bmp680.py`, you'll need the following:
- A Raspberry Pi running Raspbian Buster Lite or a similar Linux-based operating system.
- A BME680 environmental sensor connected to the Raspberry Pi via I2C. You can find wiring instructions and other details in the [BME680 Python library documentation](https://github.com/pimoroni/bme680-python).
- The `bme680` and `json` Python packages installed on the Raspberry Pi. You can install these packages using `pip3`:

 ```
  python3 -m pip3 install bme680 json
```
then type 

``` 
bash run 
```
The run file launches the eviroment, then sensor data is then written to a `ramdisk` located `/run/user/1000/its/` as JSON file in the `bmp680.json`


You can access this file and view the sensor data using a text editor or a command 
```bash
cat /run/user/1000/its/bmp680.json
```
http://localhost:8000 

This will show the most recent JSON object in the `bmp680.json` file in a formatted way.

## Contributing

Contributions are welcome. If you find a bug or want to suggest an improvement, please open an issue or a pull request on GitHub.


## License

This script is licensed under the MIT License. See the `LICENSE` file for details.
