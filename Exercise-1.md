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
