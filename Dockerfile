FROM centos:8
MAINTAINER olas991@gmail.com
ENV container docker
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
RUN dnf install -y httpd zip unzip
ADD https://freewebsitetemplates.com/download/rehabilitation-yoga.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip rehabilitation-yoga.zip
RUN cp -rvf rehabilitation-yoga/* .
RUN rm -rf rehabilitation-yoga rehabilitation-yoga.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 
