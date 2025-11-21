FROM centos:8
MAINTAINER olas991@gmail.com
RUN yum install -y httpd zip unzip
ADD http://templates.ironspider.ca/template51/template51.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip template51.zip
RUN cp -rvf template51/* .
RUN rm -rf template51 template51.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 
