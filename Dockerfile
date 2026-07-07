# Dockerfile
FROM node:24-alpine

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# Desactivar la verificación estricta de SSL temporalmente por el certificado vencido de Nexus
RUN npm config set strict-ssl false

# Instalar dependencias
RUN npm install

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]
