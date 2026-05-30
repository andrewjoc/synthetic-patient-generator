FROM sapmachine:21-jdk-ubuntu

RUN apt-get update && apt-get install -y git
WORKDIR /opt/app/
RUN git clone https://github.com/synthetichealth/synthea.git
RUN mkdir /opt/app/generated_data

# CMD ["./run_synthea", "-s", "21", "-p", "100", "Alaska", "Fairbanks", "--exporter.csv.export=true", "--exporter.baseDirectory='../generated_data'"]

# docker run -v "/Users/andrewoconnor/Projects/synthea/generated_data:/opt/app/generated_data" synthea-test:latest

# docker run --name test_generator -v "/Users/andrewoconnor/Projects/synthea/generated_data:/opt/app/generated_data" -d synthea_generator:latest