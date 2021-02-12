## 2. Elasticsearch Installation in a docker container 

# Installing Elasticsearch using Docker 

**Step 1:**

Installed docker in the machine. Need to follow the list of steps.
| **#no** | **script**                                                                                                                                                                                          | **comment**                                                                                  |
|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| 1       | sudo apt install docker.io                                                                                                                                                                          | Install docker services.                                                                     |
| 2       | sudo usermod -aG docker \${USER}                                                                                                                                                                    | Add user to the docker group.  Note : Need to log out and log back for updating group user.  |
| 3       | \# --network=elastic_search \\ docker run -d \\  -p 9200:9200 \\  -p 9300:9300 \\  --name elasticsearch \\  -e "discovery.type=single-node" \\  docker.elastic.co/elasticsearch/elasticsearch:6.6.1 | Need to install Elasticsearch using docker image                                             |
| 4       | docker start /elasticsearch                                                                                                                                                                         | Need to start docker                                                                         |
| 5       | curl -s localhost:9200/_cat/health                                                                                                                                                                  | Health check of Elastic search                                                               |

![](../media/1448ffc30be9da76223dae58726c65ea.png)![](media/cde4005a41a4f1a39d31b0d0f830a792.png)

![](../media/ea2cfef402387b672d5fb953dbce6dcf.png)

**Output:**

![](../media/067b9334a6df79c7fd578fd8172c4ffd.png)

**Step2:** check the Elasticsearch health  
**script:** <i>curl -s localhost:9200/_cat/health </i>
            <i>curl -X GET "localhost:9200/_cat/nodes?v=true&pretty"  </i>
            
**output:**

![](../media/1a76af3ee7ab193684a13d82f81daa0f.png)

![](../media/55c8ad404ddb6d9ec1189653a158eddb.png)
