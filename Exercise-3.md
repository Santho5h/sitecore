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
