pipeline{
    agent any
    stages{
        stage('Check Github'){
            steps{
                checkout([$class: 'GitSCM',branches:[[name: '*/main']],userRemoteConfigs:[[url:'https://github.com/Aniyo44/kuber.git']]])
            }
        }
    }
}