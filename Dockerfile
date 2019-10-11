# Downloading the slimmest jre linux image

FROM openjdk:8-jre-slim

MAINTAINER Vivek Kumar vivekkumar.bitsindri@gmail.com

WORKDIR /app

# COPY helloworld.jar /app
RUN apt-get update && apt-get install -y -q --no-install-recommends wget && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN wget -q https://upday-interview-test.s3-eu-west-1.amazonaws.com/helloworld.jar

CMD java -jar helloworld.jar

