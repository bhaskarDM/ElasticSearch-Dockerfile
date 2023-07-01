FROM ubuntu:22.04
ADD -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
RUN  apt-get install apt-transport-https -y
RUN  echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
RUN  apt-get update && sudo apt-get install elasticsearch -y
COPY elasticsearch.yml /etc/elasticsearch
EXPOSE 9200
RUN systemctl daemon-reload && systemctl enable elasticsearch.service && systemctl start elasticsearch.service