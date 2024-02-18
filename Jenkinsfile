pipeline{
    agent any
  environment {
    imagename = "newyaf44/myimage"
    registryCredential = 'docker-cred'
    pwd='docker-hub-access-token'
    dockerImage = ''
  }
    stages{
        stage('Check Github'){
            steps{
                checkout([$class: 'GitSCM',branches:[[name: '*/main']],userRemoteConfigs:[[url:'https://github.com/Aniyo44/kuber.git']]])
            }
        }
        stage('Build Docker'){
            steps{
                sh 'docker build -t myimage:${BUILD_NUMBER} .' 
            }
        }
      
    }
}