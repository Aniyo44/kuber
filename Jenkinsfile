pipeline {
    agent any
    environment {
        imagename = "newyaf44/myimage"
        registryCredential = 'docker-cred'
        pwd='docker-hub-access-token'
        dockerImage = ''
    }
    stages {
        stage('Check Github') {
            steps {
                checkout([$class: 'GitSCM', branches:[[name: '*/main']], userRemoteConfigs:[[url:'https://github.com/Aniyo44/kuber.git']]])
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t myimage:${BUILD_NUMBER} .'
            }
        }
        stage('Deploy to K8s with kind') {
            steps {
                script {
                    try {
                        // Create Kubernetes cluster with Kind using the specified configuration file
                        sh 'kind create cluster --name mykindcluster --config kind-config.yaml || true'
                        
                        // Load Docker image into Kind cluster
                        sh 'kind load docker-image myimage:${BUILD_NUMBER} --name mykindcluster'
                        
                        // Apply YAML file to deploy
                        sh 'kubectl apply -f kind-config.yaml'
                    } catch (Exception e) {
                        echo "An error occurred while deploying to Kind: ${e.message}"
                        // You can choose to perform any cleanup or additional actions here if needed
                    }
                }
            }
        }
    }
}
