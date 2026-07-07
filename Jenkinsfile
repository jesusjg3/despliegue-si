pipeline {
    agent any

    stages {
        stage('Construir') {
            steps {
                // Forzamos el uso del binario de Docker del host
                sh '/usr/bin/docker build -t hola-mundo-node:latest .'
            }
        }
        stage('Ejecutar') {
            steps {
                sh '''
                    /usr/bin/docker stop hola-mundo-node || true
                    /usr/bin/docker rm hola-mundo-node || true
                    /usr/bin/docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                '''
            }
        }
    }
}
