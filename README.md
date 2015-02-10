# docker-jenkins-demo
Running Jenkins and slaves on Docker

## Build and run jenkins

```
$ cd jenkins
$ docker build -t yuryu/demo-jenkins .
$ docker run -d -v /var/lib/jenkins --name jenkins-home yuryu/demo-jenkins echo Data-only container for jenkins
$ docker run --volumes-from jenkins-home -d -p 8080:8080 yuryu/demo-jenkins 
```

## Build slave image

```
$ cd slave
$ docker build -t yuryu/demo-jenkins-slave .
```

## Backup and restore

```
# mkdir /tmp/backup
# chcon -Rt svirt_sandbox_file_t /tmp/backup
$ docker run --volumes-from jenkins-home -v /tmp/backup:/backup fedora tar cfz /backup/jenkins-home.tar.gz /var/lib/jenkins

# Restore
$ docker run --volumes-from jenkins-home -v /tmp/backup:/backup fedora tar xf /backup/jenkins-home.tar.gz -C /
```
