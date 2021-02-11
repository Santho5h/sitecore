>   Cloud Operation Assessment

santhosh

>   **Table of Contents**

[1	Create an Azure free trial account	2](#_Toc63936388)

[2	Setup SSH connection for both machine	2](#_Toc63936389)

[3	Exercise	3](#_Toc63936390)

>   [3.1	Basic metrics of the machine	3](#_Toc63936391)

[Article I.	Communicate with each other server	3](#_Toc63936392)

[Article II.	Basic metric of the Linux machine	4](#_Toc63936393)

>   [3.2	Elasticsearch Installation in a docker container	6](#_Toc63936394)

[Article III.	Installing Elasticsearch using Docker	6](#_Toc63936395)

>   [3.3	Linux Problem solving	7](#_Toc63936396)

[Article IV.	Ubuntu Diagnose and solve the Redis server issue	7](#_Toc63936397)

>   [3.4	Windows problem solving	9](#_Toc63936398)

[Article V.	Windows Web applications diagnose	9](#_Toc63936399)

[4	Conclusion	11](#_Toc63936400)

#  Azure free trial account

Created two ubuntu instance for exercise in Azure free trail account.

| IP ADDRESS     | USERNAME | vCPUs | RAM    |
|----------------|----------|-------|--------|
| 40.80.92.13    | santhosh | 1     | 3.5 GB |
| 52.172.141.163 | santhosh | 1     | 3.5 GB |

# Setup SSH connection for both machine

Created ssh-key and configured both machines.

**Server 1:**

![](media/d41ca093f1acbafc0516ebb785609dfa.png)

**Server 2:**

![](media/c255ad0c25e439a78f16ec3be1a97fee.png)

# Exercise 

## Basic metrics of the machine

# Communicate with each other server

>   **Step 1:** need to generate ssh key in both machines.  
>   command: ssh-keygen

>   **Step 2:** add ssh key into another machine.

command: vi \~/.ssh/authorized\_keys

>   \#server hosts

>   52.172.141.163 test1

>   40.80.92.13 test

**Output:**

![](media/fffa272585cdb5f39a20e53b015d7374.png)

# Basic metric of the Linux machine

**Step 1:** CPU, Disk, RAM, and Network Usage:

| \#No | Items         | Scripts                                                          | comments                             |
|------|---------------|------------------------------------------------------------------|--------------------------------------|
| 1    | CPU           | top -bn1 \| grep load \| awk '{printf "%.2f%%\\t\\n", \$(NF-2)}' | List the percentage of CPU usage     |
| 2    | DISK          | df -h \| awk '\$NF=="/"{printf "%s\\t", \$5}'                    | List the percentage of Disk usage    |
| 3    | RAM           | free -m \| awk 'NR==2{printf "\\t%.2f%%\\t", \$3\*100/\$2 }'     | List the percentage of RAM usage     |
| 4    | Network Usage | sudo apt-get install ifstat ifstat -T                            | List the percentage of Network usage |

**Step 2:** Automation script creating for the environment

![](media/369f0855efbee70e16f59ba9518c6651.png)

**Step 3:** Automated script using cronjob.

![](media/226f91cdb67b9e6f3f0530bfd2b93ec9.png)

**Step 4:** Appended output from metrics.log files.  
**output:**  
![](media/a6beae384b79e7c3252b1b48ef03acc5.png)

Network Usage report:

![](media/a81e6b780c96601365f2504b9d3412aa.png)

## Elasticsearch Installation in a docker container 

# Installing Elasticsearch using Docker 

**Step 1:**

Installed docker in the machine. Need to follow the list of steps.

![](media/1448ffc30be9da76223dae58726c65ea.png)![](media/cde4005a41a4f1a39d31b0d0f830a792.png)

![](media/ea2cfef402387b672d5fb953dbce6dcf.png)

**Output:**

![](media/067b9334a6df79c7fd578fd8172c4ffd.png)

**Step2:** check the Elasticsearch health  
**script:** curl -s localhost:9200/_cat/health

curl -X GET "localhost:9200/_cat/nodes?v=true&pretty"  
**output:**

![](media/1a76af3ee7ab193684a13d82f81daa0f.png)

![](media/55c8ad404ddb6d9ec1189653a158eddb.png)

## Linux Problem solving

# Ubuntu Diagnose and solve the Redis server issue

**Step 1:** Need to check the status of Redis server.

**Script:** sudo systemctl status redis.service

![](media/21b0a6292a57c7d121a303e65e94eddc.png)

![](media/6b7557a94d0df120e18dcc2d73daa7d7.png)

Although Even rebooting the system could not help, in my case it was because of
a running background process which was found using:

ss -tulpn

killed it.

kill [process id/number]

Afterwards I could start redis service again.

Sudo systemctl service start redis

**Step 2:** Missed to add list of items in /etc/systemd/system/redis.service.  
![](media/e9bf46c3091777ca22b7ac276cc601f8.png)

**Step 3:** Need to start Redis-server as well. Redis-server –daemonize yes

![](media/4cb24028cfc948c68cb1f03cfa1b799e.png)

![](media/3a09a17fd7539328e5b56584bb95813b.png)

## Windows problem solving

# Windows Web applications diagnose

Step 1: Need to check widows errors log

C:\\Windows\\System32\\LogFiles\\HTTPERR

![](media/044bea236421f0068c488c08c86138fc.png)

# 

Step 2: Enabled HTTP Activation.

![](media/2b25f8ea057459ca3ca745a1a437acd6.png)

Step 3: Started Application pools as well.

![](media/e7fb0d4ccfcdbd450b19d738a7c921d8.png)

**Output:**  
**![](media/1e4f90e127eddfc07a48619b94966a7b.png)**

# Conclusion

As per the given tasks hereby I’m submitting my assignment. Review the document
and send your feedback.
