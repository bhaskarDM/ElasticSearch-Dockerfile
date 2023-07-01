FROM adoptopenjdk:11-jre-hotspot
ENV ES_VERSION=7.14.0
ENV ES_HOME=/usr/share/elasticsearch
ENV PATH=$ES_HOME/bin:$PATH
RUN apt-get update && apt-get install wget build-essential gcc make -y
RUN set -eux && cd /tmp && wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}-linux-x86_64.tar.gz && tar -xf elasticsearch-${ES_VERSION}-linux-x86_64.tar.gz -C /usr/share/ && rm elasticsearch-${ES_VERSION}-linux-x86_64.tar.gz && mv /usr/share/elasticsearch-${ES_VERSION} $ES_HOME
COPY elasticsearch.yml $ES_HOME/config/elasticsearch.yml
RUN chown -R daemon:daemon $ES_HOME
EXPOSE 9200 9300
USER daemon
CMD ["elasticsearch"]
