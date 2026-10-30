pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
    }

    environment {
        PATH = "C:\\Program Files\\nodejs;${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'call npm.cmd ci'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'call npm.cmd test'
            }
        }

        stage('Deploy') {
            when {
                expression {
                    env.GIT_BRANCH == 'origin/main' ||
                    env.GIT_BRANCH == 'main'
                }
            }
            steps {
                bat 'call deploy.bat'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
            echo 'Calculator URL: http://localhost:8081'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}