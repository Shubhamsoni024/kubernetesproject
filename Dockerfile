## Starting the dockerfile to work on kubernetes with the project
FROM centos:7

### Owner of the configuration file
MAINTAINER shubham.soni@rglabs.net

## updating and installing the required package
RUN yum update -y &&   \
    yum install applydeltarpm httpd wget zip unzip net-tools -y

### adding the website to the apache document root
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/gymnast.zip /var/www/html/

### Chaning the working directory
WORKDIR /var/www/html/

## extracting the website in the documentroot
RUN unzip gymnast.zip

## Copy the website file to the main document root
RUN cp -rvf gym-website-template/* .

## removing the unnessary fies
RUN rm -rf gym-website-template gymnast.zip

### Setting up the environment variable
ENV myname shubham_apache

### Starting the apache service
CMD /usr/sbin/httpd -D FOREGROUND

## opening the port in container
EXPOSE 80
