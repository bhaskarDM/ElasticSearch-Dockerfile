# Use a base image with Ubuntu
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y wget apt-transport-https

# Import the Elasticsearch GPG key
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# Add the Elasticsearch repository
RUN echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list

# Update and install Elasticsearch
RUN apt-get update && apt-get install -y elasticsearch

# Expose the Elasticsearch port
EXPOSE 9200 9300

# Start Elasticsearch
CMD ["elasticsearch"]
