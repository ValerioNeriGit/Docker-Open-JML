# Docker-Open-JML

Simple image based on the official Java 8 image to use OpenJML 

[Docker hub](https://hub.docker.com/r/valerioneri/openjml)

### How to test
To check if everything is working just the following command:
```
docker run --rm --name=jml valerioneri/openjml java -jar /openjml/openjml.jar -version
```

### How to run
To run the OpenJML container you need to mount the directory containing your java files (let's call it *code*) and add the command you want to execute, as in the following example:
``` bash
docker run --rm --name=jml -v "$(pwd)"/code:/code valerioneri/openjml java -jar /openjml/openjml.jar -esc /code/myFile.java
```
#### OpenJML Execution's options

*Type-checking*:```java -jar /openjml/openjml.jar  /code/myFile.java```

*Static checking*: ```java -jar /openjml/openjml.jar -esc /code/myFile.java```

*Runtime assertion checking*: ```java -jar /openjml/openjml.jar -rac /code/myFile.java```

Based on [OpenJML execution's option documentation ](http://www.openjml.org/documentation/execution.shtml)


### How to use with docker exec
```
docker run --rm --name=jml -t -d -v "$(pwd)"/code:/code valerioneri/openjml /bin/bash
docker exec jml  java -jar /openjml/openjml.jar -rac /code/myfile.java
```

### Useful OpenJML Docs
[OpenJML command line's options' documentation ](https://www.openjml.org/documentation/commandline.shtml)

