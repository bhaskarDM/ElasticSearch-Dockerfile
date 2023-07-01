FROM ubuntu:22.04
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN sudo apt-get install apt-transport-https -y
RUN echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
RUN sudo apt-get update && sudo apt-get install elasticsearch -y
COPY elasticsearch.yml /etc/elasticsearch
EXPOSE 9200
RUN systemctl daemon-reload && systemctl enable elasticsearch.service && systemctl start elasticsearch.service