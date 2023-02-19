FROM  centos:latest
RUN yum install -y httpd
COPY /var/lib/jenkins/workspace/k8sjenkins-pipeline/* /var/www/html/
EXPOSE 8080