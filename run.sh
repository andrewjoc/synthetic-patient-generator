DATA_DIR="generated_data"
IMAGE_NAME="patient-generator"
CONTAINER_NAME="patient-generator-instance"
CURR_TIME="$(date +'%Y-%m-%d_%H%M%S')"

mkdir -p "$DATA_DIR/$CURR_TIME"

echo "Building Docker image '${IMAGE_NAME}'..."
docker build -t "$IMAGE_NAME" .

echo "Starting Docker container '${CONTAINER_NAME}'..."
docker run -dit \
    --name "$CONTAINER_NAME" \
    -v "$(pwd)/$DATA_DIR/$CURR_TIME:/opt/app/generated_data" "$IMAGE_NAME":latest


echo "Generating patient data..."

PARAMS=(
    "./run_synthea"
    "-s" "21"
    "-p" "20"
    "Alaska"
    "Fairbanks"
    "--exporter.csv.export=True"
    "--exporter.baseDirectory=../generated_data"
)

printf "%s\n" "${PARAMS[@]}" >> "$DATA_DIR/$CURR_TIME"/parameters.txt

docker exec -w /opt/app/synthea "$CONTAINER_NAME" "${PARAMS[@]}"

echo "Data generation finished. Tearing down container..."
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"

