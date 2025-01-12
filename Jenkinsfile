pipeline {
    agent { label 'homelab' }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'git clone https://github.com/homemlinux/kubelab && cd kubelab'
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
