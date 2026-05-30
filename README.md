# synthetic-patient-generator

A containerized environment to simulate patient data using [Synthea](https://github.com/synthetichealth/synthea).

The script builds the Docker image, runs the generation script, saves the result to a local director named `generated_data` in the current directory, and tears down the container.

# Setup
Requires Docker

Edit `PARAMS` in `run.sh` to customize the synthetic population. See the [documentation](https://github.com/synthetichealth/synthea#generate-synthetic-patients) for more information about each flag. 

For example, the following parameters uses seed 21 and generates 20 patients from Fairbanks, Alaska. The output consists of csv files and is located in the `generated_data` directory within the container.
```
PARAMS=(
    "./run_synthea"
    "-s" "21"
    "-p" "20"
    "Alaska"
    "Fairbanks"
    "--exporter.csv.export=True"
    "--exporter.baseDirectory=../generated_data"
)
```

<br>

To run the script, use the following commands
```
chmod +x run.sh
./run.sh
```
