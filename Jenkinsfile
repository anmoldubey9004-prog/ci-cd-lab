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
                script {
                    def checkoutInfo = checkout scm
                    env.CHECKED_OUT_BRANCH = checkoutInfo.GIT_BRANCH ?: ''
                    echo "Checked out branch: ${env.CHECKED_OUT_BRANCH}"
                }
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
                    env.CHECKED_OUT_BRANCH == 'origin/main' ||
                    env.CHECKED_OUT_BRANCH == 'main'
                }
            }
            steps {
                bat 'call deploy.bat'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished. Check Deploy stage and localhost:8081.'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}