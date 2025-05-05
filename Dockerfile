kubectl get pod ar-service-67f84889f9-n2qm8 -n pcs -o json | jq '.metadata.finalizers'
#!/bin/bash

# Simulación del comando 'watch' en Git Bash
while true; do
  clear
  kubectl get pods
  sleep 2
done

chmod +x watch-kube.sh

nano ~/.bashrc

alias watch-kube='bash /ruta/completa/a/watch-kube.sh'

source ~/.bashrc

locals {
${data.azurerm_user_assigned_identity.aks_identity.resource_group_name}
  app_insights_name  = "${local.product}-${local.resource_group_location}-${local.environment}-appinsights"
  app_insights_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Insights/components/${local.app_insights_name}"
}
kubectl create secret docker-registry regcred \
  --docker-server=inverstan-docker-snapshot-local.docker.fis.dev \
  --docker-username=TU_USUARIO \
  --docker-password=TU_CONTRASEÑA \
  --docker-email=TU_EMAIL
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
