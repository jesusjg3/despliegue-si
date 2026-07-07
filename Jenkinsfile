pipeline {
    agent any

    stages {
        stage('Construir') {
            steps {
                // Aquí usamos el comando docker de tu sistema anfitrión
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }
        stage('Ejecutar') {
            steps {
                sh '''
                    docker stop hola-mundo-node || true
                    docker rm hola-mundo-node || true
                    docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                '''
            }
        }
    }
}
