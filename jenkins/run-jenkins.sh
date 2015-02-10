#!/bin/sh

JENKINS_HOME="/var/lib/jenkins"
JENKINS_USER="jenkins"
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true"
JENKINS_PORT="8080"
JENKINS_HANDLER_MAX="100"
JENKINS_HANDLER_IDLE="20"

JAVA_CMD="/usr/bin/java $JENKINS_JAVA_OPTIONS -DJENKINS_HOME=$JENKINS_HOME -jar /usr/lib/jenkins/jenkins.war"
OPTIONS="--httpPort=$JENKINS_PORT --handlerCountMax=$JENKINS_HANDLER_MAX --handlerCountMaxIdle=$JENKINS_HANDLER_IDLE "

cd "$JENKINS_HOME"
exec runuser -u $JENKINS_USER -- $JAVA_CMD $OPTIONS
