FROM openjdk:8-jdk-bullseye

RUN apt update && apt install -y libgomp1 \
	&& apt-get -y clean \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /openjml \
    && wget https://github.com/OpenJML/OpenJML/releases/download/0.8.59/openjml-0.8.59-20211116.zip --output-document=openjml.zip \
    && unzip openjml.zip -d /openjml \
    && rm openjml.zip 

#CMD ["java", "-jar", "/openjml/openjml.jar"]
