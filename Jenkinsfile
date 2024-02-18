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
        stage('Push Docker'){
              steps {
                withCredentials([string(credentialsId: 'docker-hub-access-token', variable: 'docker-hub-acess-token')]) {
                    sh 'docker  login -u newyaf44 p- ${pwd}'
                    sh 'docker push myimage:${BUILD_NUMBER}'
                }
            }
        }
    }
}