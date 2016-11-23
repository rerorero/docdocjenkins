docdocjenkins
=====
It is a fork from [official docker](https://hub.docker.com/r/_/jenkins/) to use the docker plugin.  
See also [here] (http://container-solutions.com/running-docker-in-jenkins-in-docker/).  
The difference is as follows.  
- Giving sudo privilege to jenkins user
- Changed uid and gid of jenkins to 10500
- Some plugins are preinstalled.[docdocplugins.txt](/docdocplugins.txt)

# Usage
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
              -v $(which docker):/usr/bin/docker \
              -v /your/home:/var/jenkins_home
              -p 8080:8080 \
              -p 50000:50000 \
              rerorero:docdocjenkins
```

