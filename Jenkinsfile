pipeline {
    // Usamos 'any' porque el agente es el nodo maestro (donde instalamos docker)
    agent any

    tools {
        // Asegúrate que estos nombres coincidan EXACTAMENTE con los que pusiste en 'Manage Jenkins -> Tools'
        nodejs "Nodesi" 
        // Si no tienes configurada la herramienta Docker en Jenkins, 
        // comenta o elimina la siguiente línea para evitar errores de búsqueda:
        // dockerTool 'Docker' 
    }

    stages {
        stage('Construir Imagen Docker') {
            steps {
                // Usamos 'sh' para llamar al binario que instalamos en el contenedor
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }

        stage('Ejecutar Contenedor Node.js') {
            steps {
                sh '''
                    # Usamos || true para que el pipeline no falle si el contenedor no existe
                    docker stop hola-mundo-node || true
                    docker rm hola-mundo-node || true

                    # Ejecutamos el nuevo contenedor
                    docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                '''
            }
        }
    }
    
    // Opcional: Limpieza automática al terminar
    post {
        always {
            echo 'Pipeline finalizado.'
        }
        failure {
            echo 'Algo salió mal, revisa los logs anteriores.'
        }
    }
}
