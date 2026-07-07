pipeline {
    agent any

    tools {
        nodejs "Nodesi" // Mantenemos solo Node, que sí está configurado
    }

    stages {
        stage('Construir') {
            steps {
                // Aquí ya no hace falta declarar la tool, Jenkins usará el 'docker' del sistema
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
