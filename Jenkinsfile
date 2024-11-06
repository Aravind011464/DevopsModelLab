pipeline {
    agent any

    environment {
        // Default image name
        DOCKER_IMAGE = 'my-web-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build Docker image
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'staging'  // Deploy to staging only when the branch is "staging"
            }
            steps {
                script {
                    // Deploy the image to the staging environment
                    echo 'Deploying to Staging...'
                    sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'  // Deploy to production only when the branch is "main"
            }
            steps {
                script {
                    // Deploy the image to the production environment
                    echo 'Deploying to Production...'
                    sh 'docker run -d -p 80:3000 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Cleanup after deployment
            echo 'Cleaning up Docker containers...'
            sh 'docker ps -a -q | xargs docker rm -f'
        }
    }
}
