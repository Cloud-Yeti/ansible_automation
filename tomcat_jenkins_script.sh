#!/bin/bash
sudo yum install tomcat -y
sudo echo 'JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx1026m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"'>>/usr/share/tomcat/conf/tomcat.conf
# install the web application manager and the documentation,
sudo yum install tomcat-webapps tomcat-admin-webapps -y
sudo yum install tomcat-docs-webapp tomcat-javadoc -y
sudo cat /usr/share/tomcat/conf/tomcat-users.xml | sed 's/<tomcat-users>/<tomcat-users>\n<user username="admin" password="password" roles="manager-gui,admin-gui"/>/g' > /usr/placeholder.xml
sudo cp /usr/placeholder.xml /usr/share/tomcat/conf/tomcat-users.xml
# start the service and to ensure that the service is started when Centos powers on
sudo service tomcat start
sudo chkconfig tomcat on
# install jenkins inside tomcat
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war --no-check-certificate 
sudo cp jenkins.war /var/lib/tomcat/webapps
# Note: you can always to to /usr/share/tomcat/.jenkins/secrets/initialAdminPassword to see your initialAdminPassword
sudo yum update -y
sudo yum install git -y
