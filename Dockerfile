FROM  centos:latest
RUN yum update -y
RUN yum install httpd -y
COPY /var/lib/jenkins/workspace/k8sjenkins-pipeline/* /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 8080