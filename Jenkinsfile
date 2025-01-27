pipeline {
    agent { label 'homelab' }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'git clone https://github.com/gabrielandradecunha/kubelab && cd kubelab'
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
