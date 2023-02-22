# BME680 Sensor json

`bme680.py` Samples sensor data from a BME680
Writes to the ram as a JSON file.
THe json is updated/overwritten every X seconds  

# Perpose 
To later be used by Front ends and or lager databases.


## Requirements

- Python3 pip3
- bme680 library (install with `python3 -m pip install bme680`)
```bash
python3 -m pip install bme680
```

## Usage

1. Connect the BME680 sensor to your device.
2. Clone and cd into it repo
`
git clone https://github.com/Tearran/its_bmp680.git && cd its_bmp680
`
2. cd into the repo Run the `bme680.py` script as a background prosses `python3 bme680.py&`
3. The sensor data will be logged to a JSON file (`/run/user/1000/its/bmp680.json`) every second.

# or use 

## The included example 
bash script sets up develoment eviroment, 
1. starts bme680.py 
2. starts a local server to host the said json, 
3. genirates a index.html in the ram 
4. Html displays the data in a readalbel format via js
5. navigate to http://localhost:8000/bme680.json 

This will show the most recent JSON object in the `bmp680.json`.

## Contributing

Contributions are welcome. If you find a bug or want to suggest an improvement, please open an issue or a pull request on GitHub.


## License

This script is licensed under the MIT License. See the `LICENSE` file for details.
