pipeline {
    agent any

    stages {
        stage('Construir Imagen') {
            steps {
                // Usamos la ruta absoluta que instalamos dentro del contenedor
                sh '/usr/bin/docker build -t hola-mundo-node:latest .'
            }
        }

        stage('Ejecutar Contenedor') {
            steps {
                sh '''
                    # Usamos la ruta absoluta y || true para evitar fallos si no existen
                    /usr/bin/docker stop hola-mundo-node || true
                    /usr/bin/docker rm hola-mundo-node || true

                    # Ejecutamos el contenedor
                    /usr/bin/docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                '''
            }
        }
    }
}
