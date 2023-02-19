FROM  centos:latest
RUN yum install httpd -y
COPY /var/lib/jenkins/workspace/k8sjenkins-pipeline/* /var/www/html/
EXPOSE 8080