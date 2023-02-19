FROM  alpine
RUN apk update 
RUN apk add apache2
COPY . /var/www/html/
CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
EXPOSE 80