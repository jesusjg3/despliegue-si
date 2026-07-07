pipeline {
    agent {
        // Esta imagen tiene Docker y Git preinstalados
        docker { 
            image 'docker:latest' 
            // Esto conecta el contenedor con el Docker de tu PC (CachyOS)
            args '-v /var/run/docker.sock:/var/run/docker.sock' 
        }
    }

    stages {
        stage('Construir') {
            steps {
                // Ahora 'docker' estará disponible en el PATH de este agente
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
