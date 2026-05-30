FROM sapmachine:21-jdk-ubuntu

RUN apt-get update && apt-get install -y git
WORKDIR /opt/app/
RUN git clone https://github.com/synthetichealth/synthea.git
RUN mkdir /opt/app/generated_data