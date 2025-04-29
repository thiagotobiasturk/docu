FROM debian:bullseye

# Instalar ClamAV y utilidades necesarias
RUN apt-get update && apt-get install -y \
    clamav \
    clamav-daemon \
    clamav-freshclam \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Actualizar definiciones de virus
RUN freshclam

# Exponer el puerto del servicio ClamAV
EXPOSE 3310

# Iniciar el servicio clamd al iniciar el contenedor
CMD ["clamd", "-c", "/etc/clamav/clamd.conf"]

# Imagen base oficial de Alpine con ClamAV
FROM clamav/clamav:latest

# Opcional: Actualiza los virus y deja el contenedor listo
RUN freshclam

# Exponer puertos si se usa como servicio
EXPOSE 3310

# Comando por defecto (puede variar según tu uso)
CMD ["clamd"]
apiVersion: apps/v1
kind: Deployment
metadata:
  name: windows-test-deployment
  labels:
    app: windows-test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: windows-test
  template:
    metadata:
      labels:
        app: windows-test
    spec:
      containers:
        - name: windows-test
          image: inverstan-docker-snapshot-local.docker.fis.dev/windows-test:latest
          imagePullPolicy: Always
      imagePullSecrets:
        - name: regcred
