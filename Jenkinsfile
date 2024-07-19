pipeline{
    environment {
        registry = "sjw2023/docker-play-ground"
        registryCredential = 'sjw2023'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build("sjw2023/docker-play-ground")
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
