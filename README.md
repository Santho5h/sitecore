![](RackMultipart20210211-4-vgkqvu_html_d336b6b08ffd417d.gif)Assessment Cloud Operations Engineer

#
# Cloud Operation Assessment

# santhosh

# **Table of Contents**

[1 Create an Azure free trial account ](#_Toc63936388)

[2 Setup SSH connection for both machine ](#_Toc63936389)

[3 Exercise ](#_Toc63936390)

[3.1 Basic metrics of the machine ](#_Toc63936391)

[Article I. Communicate with each other server ](#_Toc63936392)

[Article II. Basic metric of the Linux machine ](#_Toc63936393)

[3.2 Elasticsearch Installation in a docker container ](#_Toc63936394)

[Article III. Installing Elasticsearch using Docker ](#_Toc63936395)

[3.3 Linux Problem solving ](#_Toc63936396)

[Article IV. Ubuntu Diagnose and solve the Redis server issue ](#_Toc63936397)

[3.4 Windows problem solving ](#_Toc63936398)

[Article V. Windows Web applications diagnose ](#_Toc63936399)

[4 Conclusion ](#_Toc63936400)

1.
# Create an Azure free trial account

Created two ubuntu instance for exercise in Azure free trail account.

| IP ADDRESS | USERNAME | vCPUs | RAM |
| --- | --- | --- | --- |
| 40.80.92.13 | santhosh | 1 | 3.5 GB |
| 52.172.141.163 | santhosh | 1 | 3.5 GB |

1.
# Setup SSH connection for both machine

Created ssh-key and configured both machines.

**Server 1**** :**

![](RackMultipart20210211-4-vgkqvu_html_f50101e556da3839.png)

**Server 2:**

![](RackMultipart20210211-4-vgkqvu_html_e5b16c792c805301.png)

1.
# Exercise

  1.
## Basic metrics of the machine

1.
# Communicate with each other server

**Step 1:** need to generate ssh key in both machines.
 command: ssh-keygen

**Step 2:** add ssh key into another machine.

command: vi ~/.ssh/authorized\_keys

#server hosts

52.172.141.163 test1

40.80.92.13 test

**Output:**

![](RackMultipart20210211-4-vgkqvu_html_abc1bc892e1234bd.png)

1.
# Basic metric of the Linux machine

**Step 1:** CPU, Disk, RAM, and Network Usage:

| #No | **Items** | Scripts | **comments** |
| --- | --- | --- | --- |
| 1 | CPU | top -bn1 | grep load | awk &#39;{printf &quot;%.2f%%\t\n&quot;, $(NF-2)}&#39; | List the percentage of CPU usage |
| **2** | DISK | df -h | awk &#39;$NF==&quot;/&quot;{printf &quot;%s\t&quot;, $5}&#39; | List the percentage of Disk usage |
| **3** | RAM | free -m | awk &#39;NR==2{printf &quot;\t%.2f%%\t&quot;, $3\*100/$2 }&#39; | List the percentage of RAM usage |
| **4** | Network Usage | sudo apt-get install ifstatifstat -T
 | List the percentage of Network usage |

**Step 2:** Automation script creating for the environment

![](RackMultipart20210211-4-vgkqvu_html_9b285a0c57feb2a3.png)

**Step 3:** Automated script using cronjob.

![](RackMultipart20210211-4-vgkqvu_html_ff09642b8f67669a.png)

**Step 4:** Appended output from metrics.log files.
**output:**
 ![](RackMultipart20210211-4-vgkqvu_html_db4f43f2d30ca6c4.png)

Network Usage report:

![](RackMultipart20210211-4-vgkqvu_html_14706032e5519e21.png)

  1.
## Elasticsearch Installation in a docker container

1.
# Installing Elasticsearch using Docker

**Step 1:**

Installed docker in the machine. Need to follow the list of steps.

![](RackMultipart20210211-4-vgkqvu_html_39fd4a358ca131d5.png) ![](RackMultipart20210211-4-vgkqvu_html_230f21eeb56bcecb.png)

![](RackMultipart20210211-4-vgkqvu_html_e2f349eee9147ab8.png)

**Output:**

![](RackMultipart20210211-4-vgkqvu_html_1201626d5e8abe8c.png)

**Step2:** check the Elasticsearch health
**script:** curl -s localhost:9200/\_cat/health

curl -X GET &quot;localhost:9200/\_cat/nodes?v=true&amp;pretty&quot;
**output:**

![](RackMultipart20210211-4-vgkqvu_html_e74b027f5c97e705.png)

![](RackMultipart20210211-4-vgkqvu_html_360c24542d3fb7ae.png)

  1.
## Linux Problem solving

1.
# Ubuntu Diagnose and solve the Redis server issue

**Step 1:** Need to check the status of Redis server.

**Script:** sudo systemctl status redis.service

![](RackMultipart20210211-4-vgkqvu_html_38ceabe8d4b12be9.png)

![](RackMultipart20210211-4-vgkqvu_html_27afde6ac6ed0a53.png)

Although Even rebooting the system could not help, in my case it was because of a running background process which was found using:

ss -tulpn

killed it.

kill [process id/number]

Afterwards I could start redis service again.

Sudo systemctl service start redis

**Step 2:** Missed to add list of items in /etc/systemd/system/redis.service.
 ![](RackMultipart20210211-4-vgkqvu_html_553626ed7406e3a9.png)

**Step 3:** Need to start Redis-server as well. Redis-server –daemonize yes

![](RackMultipart20210211-4-vgkqvu_html_a93c63875260dd53.png)

![](RackMultipart20210211-4-vgkqvu_html_644b206da9bda756.png)

  1.
## Windows problem solving

1.
# Windows Web applications diagnose

Step 1: Need to check widows errors log

C:\Windows\System32\LogFiles\HTTPERR

![](RackMultipart20210211-4-vgkqvu_html_ecaf486e0eb8fa39.png)

#

Step 2: Enabled HTTP Activation.

![](RackMultipart20210211-4-vgkqvu_html_95d0439e0a07111a.png)

Step 3: Started Application pools as well.

![](RackMultipart20210211-4-vgkqvu_html_b4db9f24a8c3ba74.png)

**Output:**
 ![](RackMultipart20210211-4-vgkqvu_html_f68243e446583740.png)

1.
# Conclusion

As per the given tasks hereby I&#39;m submitting my assignment. Review the document and send your feedback.

Page **6** of **6**
