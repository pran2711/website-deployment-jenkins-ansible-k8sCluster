node {
    stage("git checkout"){
        git 'https://github.com/pran2711/website-deployment-jenkins-ansible-k8sCluster.git'
    }
    
    stage("build docker file and tagging"){
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID docops27/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID docops27/$JOB_NAME:latest'
    }
    
    stage("login and push image to dockerhub"){
       withCredentials([string(credentialsId: 'docker_login', variable: 'docker_login')]) {
     sh 'docker login -u docops27 -p ${docker_login}'
     sh 'docker image push  docops27/$JOB_NAME:v1.$BUILD_ID'
     sh 'docker image push docops27/$JOB_NAME:latest'
   } 
    }
    
    
  stage("copying ansible playbook to ansible server"){
      sshagent(['ansible']) {
    sh 'ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.200 cd /home/ec2-user'
    sh 'scp -r /var/lib/jenkins/workspace/k8s-jenkins-ansible-website/playbook.yml ec2-user@172.31.43.200:/home/ec2-user'
}
  }
    
     stage("copying k8s files to k8s master"){
      sshagent(['ansible']) {
    sh 'ssh -o StrictHostKeyChecking=no ec2-user@13.233.95.120 cd /home/ec2-user'
    sh 'scp -r /var/lib/jenkins/workspace/k8s-jenkins-ansible-website/k8s/depl.yml ec2-user@13.233.95.120:/home/ec2-user'
    sh 'scp -r /var/lib/jenkins/workspace/k8s-jenkins-ansible-website/k8s/service.yml ec2-user@13.233.95.120:/home/ec2-user'
      }
  }
  
   stage("running playbook"){
      sshagent(['ansible']) {
    sh 'ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.200 cd /home/ec2-user'
    sh 'ssh -o StrictHostKeyChecking=no ec2-user@172.31.43.200 ansible-playbook playbook.yml'
     }
}
 
    
}
