FROM ubuntu:latest
RUN apt-get update && apt-get install -y git openjdk-15-jdk wget tar
ENV ES_VERSION=7.13.4
ENV ES_HOME=/opt/elasticsearch
RUN wget -q https://github.com/elastic/elasticsearch/archive/v${ES_VERSION}.tar.gz -O elasticsearch.tar.gz && tar -xf elasticsearch.tar.gz && mv elasticsearch-${ES_VERSION} ${ES_HOME} && rm elasticsearch.tar.gz
WORKDIR ${ES_HOME}
RUN ./gradlew assemble
EXPOSE 9200 9300
CMD ["./bin/elasticsearch"]
