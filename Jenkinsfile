pipeline {
  agent any 
    stages{
      stage("Docker Build"){
        steps{
          script {
            last_started = env.STAGE_NAME
          sh "docker build -t docker ."   
        }  
      }
      }
      stage("Run Docker image"){
        steps{
          script {
            last_started = env.STAGE_NAME
          sh "docker run --name nginx -itd -p 9000:80 docker:latest"   
        }  
      } 
      }
      stage("Pushing to docker hub"){
        steps{
           script {
            last_started = env.STAGE_NAME
          withCredentials([usernamePassword(credentialsId: 'mani', passwordVariable: 'pass', usernameVariable: 'userId')]) {
            sh 'docker login -u ${userId} -p ${pass}'
            sh "docker commit nginx ma12/docker:latest"
            sh "docker push ma12/docker:latest"   
          }
        }  
      }
   }
}
post {
    success {
      echo 'Successfully completed '    
    }
    failure {
       //echo "Error caught${env.err}"
       echo "Build failed at $last_started"
    }  
    }
}


