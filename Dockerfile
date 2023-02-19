FROM  alpine
RUN apk update 
RUN apk add apache2
COPY . /var/www/html/
ENTRYPOINT ["service", "apache2", "start"]
EXPOSE 8080