pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "renish38/myapp:latest"
        DOCKER_USER = "renish38"
        DOCKER_PASS = "renish40"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/renishxxd/guvi_main.git', 
                    shallow: false
            }
        }

        stage('Check Workspace Files') {
            steps {
                powershell 'dir'
            }
        }

        stage('Build Docker Image') {
            steps {
                powershell 'docker build -t $env:DOCKER_IMAGE .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                powershell 'docker login -u $env:DOCKER_USER -p $env:DOCKER_PASS'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                powershell 'docker push $env:DOCKER_IMAGE'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                powershell '''
                    minikube start
                    if (-Not (kubectl get deployment myapp -ErrorAction SilentlyContinue)) {
                        kubectl create deployment myapp --image=$env:DOCKER_IMAGE --dry-run=client -o yaml > deployment.yaml
                        kubectl apply -f deployment.yaml
                        kubectl expose deployment myapp --type=NodePort --port=80
                    } else {
                        Write-Host "Deployment already exists. Skipping deployment creation."
                    }
                '''
            }
        }

        stage('Get Service URL') {
            steps {
                powershell 'minikube service myapp --url'
            }
        }
    }
}
