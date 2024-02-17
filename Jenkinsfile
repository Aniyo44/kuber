pipeline{
    agent any
    stages{
        stage('Check Github'){
            steps{
                checkout([$class: 'GitSCM',branches:[[name: '*/main']],userRemoteConfigs:[[url:'https://github.com/Aniyo44/kuber.git']]])
            }
        }
        stage('Build Docker'){
            steps{
                sh 'docker build -t my-image:${BUILD_NUMBER} .'
            }
        }
        stage('Push Docker'){
              steps {
                withCredentials([string(credentialsId: 'docker-hub-access-token', variable: 'docker-hub-acess-token')]) {
                    sh 'docker login -u newyaf44 -p $docker-hub-access-token'
                    sh 'docker push my-image:${BUILD_NUMBER}'
                }
            }
        }
    }
}