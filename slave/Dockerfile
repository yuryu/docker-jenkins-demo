FROM registry.access.redhat.com/rhel
MAINTAINER Haruka Iwao

RUN yum -y upgrade

RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y install openssh-server java-1.7.0-openjdk

RUN adduser jenkins
RUN echo "jenkins:jenkins" | chpasswd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa

RUN yum -y install gcc gcc-c++ automake autoconf make git libtool

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
