FROM php:7.2-apache

COPY omsampleapp/ /var/www/html/

#RUN apk update; \

#    apk upgrade;

 

#RUN docker-php-ext-install mysqli


RUN apt-get update

RUN docker-php-ext-install pdo_mysql
