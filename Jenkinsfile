pipeline {
    agent any

    stages {
        stage('Construir Imagen Docker') {
            steps {
                // Ahora usará el Docker moderno de tu máquina, con BuildKit activo por defecto
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }

        stage('Ejecutar Contenedor Node.js') {
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
