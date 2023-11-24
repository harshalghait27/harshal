Docker Files

############
FROM ubuntu:18.04
RUN echo "Hello All welcome to Docker" > /tmp/myfile

#############

[root@ip-172-31-5-58 data]# cat Dockerfile
FROM ubuntu:18.04
WORKDIR /tmp
RUN echo "Hello All" > myfile
ENV name shantanu
COPY sample.war /tmp
ADD shantanu.tar.gz /tmp
[root@ip-172-31-5-58 data]# ls -ltr
total 16
-rw-r--r-- 1 root root 4606 Mar 31  2012 sample.war
-rw-r--r-- 1 root root  123 May  7 01:40 shantanu.tar.gz
-rw-r--r-- 1 root root  125 May  7 01:42 Dockerfile
[root@ip-172-31-5-58 data]#


docker run -it myimage bash

########################################

FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install apache2 -y
RUN apt-get install vim -y

optimise this

[root@ip-172-31-5-58 data]# cat Dockerfile
FROM ubuntu:18.04
RUN apt-get update && apt-get install vim curl apache2 -y


############################
CMD

[root@ip-172-31-5-58 data]# cat Dockerfile
FROM centos:8
CMD ping localhost -c 20


[root@ip-172-31-5-58 data]# cat Dockerfile
FROM centos:8
ENTRYPOINT ping localhost -c 20

######################

exec format

FROM centos:8
ENTRYPOINT [ "ping", "localhost", "-c", "10" ]

########################

[root@ip-172-31-5-58 data]# docker run -d -p 80:80 apache
fa79b5c4adf53d7a2a7fd55f7396aeded9908456192c619c6136878da54d35d3
[root@ip-172-31-5-58 data]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                               NAMES
fa79b5c4adf5   apache    "/usr/sbin/apache2ct…"   5 seconds ago   Up 4 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   nervous_faraday
[root@ip-172-31-5-58 data]#
[root@ip-172-31-5-58 data]# cat index.html
hello world
[root@ip-172-31-5-58 data]# ls-ltr
-bash: ls-ltr: command not found


[root@ip-172-31-5-58 data]# cat Dockerfile
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN service apache2 restart
COPY index.html /var/www/html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

#############################
ubuntu httpd docker file

[root@ip-172-31-32-208 mnt]# cat Dockerfile
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN service apache2 restart
COPY index.html /var/www/html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
[root@ip-172-31-32-208 mnt]#



###############

for centos

[root@ip-172-31-32-208 mnt]# cat Dockerfile
FROM centos:8
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
COPY index.html /var/www/html/
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd", "-DFOREGROUND" ]
[root@ip-172-31-32-208 mnt]#


