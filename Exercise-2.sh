#! /bin/bash
#install docker service
sudo apt install docker.io
sudo usermod -aG docker ${USER}

#installing Docker container
# --network=elastic_search \
sudo docker run -d \
        -p 9200:9200 \
        -p 9300:9300 \
        --name elasticsearch \
        -e "discovery.type=single-node" \
        docker.elastic.co/elasticsearch/elasticsearch:6.6.1
#start docker
sudo docker start /elasticsearch

# health check
curl -s localhost:9200/_cat/health curl -X GET "localhost:9200/_cat/nodes?v=true&pretty"
