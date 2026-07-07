pipeline {
    agent any

    tools {
        nodejs "Nodesi" // El nombre exacto que configuraste
        dockerTool 'Docker' // El nombre que configuramos en el paso anterior
    }

    stages {
        stage('Construir Imagen') {
            steps {
                // Ahora Jenkins sabe dónde está el binario gracias a 'dockerTool'
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }
        stage('Ejecutar Contenedor') {
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
