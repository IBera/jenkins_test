pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'terraform -version'
                sh 'az version'
            }
        }
    }
}
