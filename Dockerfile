FROM openjdk:8-jdk-stretch

RUN apt update && apt install wget unzip

RUN mkdir /openjml \
    && wget https://github.com/OpenJML/OpenJML/releases/download/0.8.42/openjml-0.8.42-20190401.zip --output-document=openjml.zip \
    && unzip openjml.zip -d /openjml \
    && rm openjml.zip 

RUN apt-get purge -y wget unzip \
    # && apt-get -y purge $(apt-cache depends wget | awk '{ print $2 }' | tr '\n' ' ') \
    && apt-get -y purge $(apt-cache depends unzip | awk '{ print $2 }' | tr '\n' ' ') \
    apt-get -y autoremove \
    apt-get update \
    apt-get check \
    apt-get -f install \
    apt-get autoclean \



CMD ["java", "-jar", "/openjml/openjml.jar"]
