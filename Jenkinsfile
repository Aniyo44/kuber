pipeline{
    agent any
  environment {
    imagename = "newyaf44/myimage"
    registryCredential = 'docker-cred'
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
             script{
                   docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
             }
            }
        }
    }
}