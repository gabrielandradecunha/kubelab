pipeline {
    agent { label 'homelab' }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'sudo chmod +x start.sh'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'sudo ./start.sh'
                }
            }
        }
    }
}
