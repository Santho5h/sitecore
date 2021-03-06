## Linux Problem solving

# Ubuntu Diagnose and solve the Redis server issue

**Step 1:** Need to check the status of Redis server.

**Script:** sudo systemctl status redis.service

![](media/21b0a6292a57c7d121a303e65e94eddc.png)

![](media/6b7557a94d0df120e18dcc2d73daa7d7.png)

**Step 2:** First findout the redis service path using locate command. Then checked /etc/redis/redis.conf file as well.
 
>Missed to add list of items in /etc/systemd/system/multi-user.target.wants/redis-server.service. Also missed to add Type=forking in redis-server.service configuration.
>
>![](media/redis-forking.png)


**Step 3:** Need to start Redis-server as well. 

![](media/4cb24028cfc948c68cb1f03cfa1b799e.png)
Although Even rebooting the system could not help, in my case it was because of
a running background process which was found using:

ss -tulpn

killed it.

kill [process id/number]

**Afterwards I could start redis service again.**

sudo systemctl service start redis

sudo systemctl daemon-reload

( sudo redis-services --daemonize yes ) this command helps to run  backuground redis-server

>**output:**
![](media/redis-status.png)
