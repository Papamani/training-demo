pipeline {
  agent any 
    stages{
      stage("Docker Build"){
        steps{
          sh "docker build -t docker ."   
        }  
      }
      stage("Run Docker image"){
        steps{
          sh "docker run --name nginx -itd -p 8082:80 docker:latest"   
        }  
      }  
      stage("Pushing to docker hub"){
        steps{
          withCredentials([usernamePassword(credentialsId: 'mani', passwordVariable: 'pass', usernameVariable: 'userId')]) {
            sh 'docker login -u ${userId} -p ${pass}'
            sh "docker commit nginx ma12/docker:latest"
            sh "docker push ma12/docker:latest"   
          }
        }  
      }
   }
}