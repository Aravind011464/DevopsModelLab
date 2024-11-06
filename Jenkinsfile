pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-web-app:staging'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Deploy to Staging') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            sh 'docker ps -a -q | xargs docker rm -f'
        }
    }
}
