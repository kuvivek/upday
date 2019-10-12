# Downloading the slimmest jre linux image

FROM openjdk:8-jre-slim

MAINTAINER Vivek Kumar vivekkumar.bitsindri@gmail.com

RUN apt-get update && apt-get install -y -q --no-install-recommends wget && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

WORKDIR /home/myuser

COPY helloworld.jar .
#RUN wget -q https://upday-interview-test.s3-eu-west-1.amazonaws.com/helloworld.jar

CMD java -jar helloworld.jar

