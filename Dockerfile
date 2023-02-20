FROM  alpine
RUN apk update 
RUN apk add apache2
RUN rm /var/www/localhost/htdocs/index.html
COPY . /var/www/localhost/htdocs/
CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
EXPOSE 80