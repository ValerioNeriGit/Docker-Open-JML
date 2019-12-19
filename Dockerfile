FROM openjdk:8-jdk-stretch

RUN apt update && apt install wget unzip

RUN mkdir /openjml \
    && wget https://github.com/OpenJML/OpenJML/releases/download/0.8.43/openjml-0.8.43-20191210.zip --output-document=openjml.zip \
    && unzip openjml.zip -d /openjml \
    && rm openjml.zip 

RUN apt-get purge -y wget unzip \
    && apt-get -y autoremove \
    && apt-get autoclean



#CMD ["java", "-jar", "/openjml/openjml.jar"]
