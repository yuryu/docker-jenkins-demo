FROM registry.access.redhat.com/rhel
MAINTAINER Haruka Iwao

RUN yum -y upgrade

RUN curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins java git docker

ADD run-jenkins.sh /root/run-jenkins.sh

EXPOSE 8080

CMD /root/run-jenkins.sh
