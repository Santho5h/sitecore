# Basic metric of the Linux machine

**Step 1:** CPU, Disk, RAM, and Network Usage:

| \#No | Items         | Scripts                                                          | comments                             |
|------|---------------|------------------------------------------------------------------|--------------------------------------|
| 1    | CPU           | top -bn1 \| grep load \| awk '{printf "%.2f%%\\t\\n", \$(NF-2)}' | List the percentage of CPU usage     |
| 2    | DISK          | df -h \| awk '\$NF=="/"{printf "%s\\t", \$5}'                    | List the percentage of Disk usage    |
| 3    | RAM           | free -m \| awk 'NR==2{printf "\\t%.2f%%\\t", \$3\*100/\$2 }'     | List the percentage of RAM usage     |
| 4    | Network Usage | sudo apt-get install ifstat ifstat -T                            | List the percentage of Network usage |

**Step 2:** Automation script creating for the environment
| **#No** | **script**                                                                                                                                                                                                                                                                                                                                                                     | **coments**                                                                  |
|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| 1       | \#! /bin/bash \ #printf "Timestamp\\t\\tMemory\\t/root\\tCPU\\n" MEMORY=\$(free -m \| awk 'NR==2{printf "\\t%.2f%%\\t", \$3\*100/\$2 }') DISK_ROOT=\$(df -h \| awk '\$NF=="/"{printf "%s\\t", \$5}') CPU=\$(top -bn1 \| grep load \| awk '{printf "%.2f%%\\t\\n", \$(NF-2)}') TIME=\$(date "+%Y.%m.%d %H:%M:%S") printf "%s%s%s%s\\n" "\$TIME" "\$MEMORY" "\$DISK_ROOT" "\$CPU" | Run the metrics of CPU,DISK and RAM based on that time period                |
| 2       | crontab -e                                                                                                                                                                                                                                                                                                                                                                     | Automate the script                                                          |
| 3       | \*/5 \* \* \* \* (. \~/.profile;/home/santhosh/script/server_metrics.sh \>\> /home/santhosh/script/metrics.log 2\>&1)                                                                                                                                                                                                                                                          | This script run the job Every 5 minutes and update the result to metrics.log |

![](media/369f0855efbee70e16f59ba9518c6651.png)

**Step 3:** Automated script using cronjob.

![](media/226f91cdb67b9e6f3f0530bfd2b93ec9.png)

**Step 4:** Appended output from metrics.log files.  
**output:**  
![](media/a6beae384b79e7c3252b1b48ef03acc5.png)

Network Usage report:

![](media/a81e6b780c96601365f2504b9d3412aa.png)
