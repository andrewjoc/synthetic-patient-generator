# synthetic-patient-generator

A containerized environment to simulate patient data using [Synthea](https://github.com/synthetichealth/synthea).

The script builds the Docker image, runs the generation script, saves the result to a local directory named `generated_data`, and tears down the container.

# Setup
Requires Docker

Edit `PARAMS` in `run.sh` to customize the synthetic population. See the [documentation](https://github.com/synthetichealth/synthea#generate-synthetic-patients) for more information about each flag. 

The following example generates a population of 20 patients from Fairbanks, Alaska using seed 21. The output is csv and the data are saved to the `generated_data` directory within the container.
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

To run the script, run the following commands
```
# make the file executable
chmod +x run.sh

# run the script
./run.sh
```
