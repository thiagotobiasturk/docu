Scneario: Muestra pantalla "En espera" si el proceso excede los 3 segundos
Given que el usuario se encuentra en la pantalla "Cuadro de Marcha"
And el proceso excede los 3 segundos
Then se debe mostrar la pantalla "En espera"
Scenario: Muestra mensajes de error progresivos tras una o dos fallas del proceso
Given que el usuario se encuentra en la pantalla "Cuadro de Marcha"
And si el proceso arroja algún código de error "Intentelo nuevamente" 
Then en la segunda respuesta de error, "Comuniquese con el representante de BBVA"
# Actualiza el repositorio de Node.js a la versión que quieras (por ejemplo, 20.x)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Reinstala Node.js desde el nuevo repositorio
sudo apt install -y nodejs

Detail-oriented and capable of managing multiple tasks simultaneously. Skilled in time management, prioritization, and following structured workflows. Familiar with agile methodologies and version control tools to maintain organized and traceable development processes.

Strong communication skills, teamwork and adaptability. Comfortable collaborating in multicultural teams and contributing to a positive work environment. Open to feedback and proactive in resolving conflicts constructively.
https://thiago-turk.itch.io/proyectunity
Team, tomorrow ill be a bit late on the morning because i have a fathers meeting on the kinder of my kids. Ill be back at 11:30 aprox (GMT -3).
Thanks
#!/bin/bash

LOG_FILE="/opt/SYMCScan/logs/spe.log"

while true; do
  echo "=== Starting new scan ==="

  if [ -f /test.txt ]; then
    /opt/SYMCScan/symcscan -s /test.txt
  else
    echo "File /test.txt not found. Skipping scan."
  fi

  # Wait for the log file to be generated
  echo "Waiting for the log to be generated: $LOG_FILE"
  while [ ! -f "$LOG_FILE" ]; do
    sleep 2
  done

  echo "Log file detected. Showing last lines..."
  tail -n 10 "$LOG_FILE"

  echo "Waiting 10 minutes before the next scan..."
  sleep 600 # 600 seconds = 10 minutes
done
#!/bin/bash

LOG_FILE="/opt/SYMCScan/logs/spe.log"

while true; do
  echo "=== Iniciando nuevo escaneo ==="

  if [ -f /test.txt ]; then
    /opt/SYMCScan/symcscan -s /test.txt
  else
    echo "Archivo /test.txt no encontrado. Se omitirá el escaneo."
  fi

  # Espera a que se genere el archivo de log
  echo "Esperando que se genere el log: $LOG_FILE"
  while [ ! -f "$LOG_FILE" ]; do
    sleep 2
  done

  echo "Archivo de log detectado. Mostrando últimas líneas..."
  tail -n 10 "$LOG_FILE"

  echo "Esperando 10 minutos para el próximo escaneo..."
  sleep 600 # 600 segundos = 10 minutos
done
#!/bin/bash

echo "Ejecutando prueba antivirus..."

# Ejecutar escaneo de prueba (modifica la ruta del archivo si es necesario)
if [ -f /test.txt ]; then
  /opt/SYMCScan/symcscan -s /test.txt
else
  echo "Archivo /test.txt no encontrado. Se omitirá el escaneo."
fi

# Espera a que el log se cree
LOG_FILE="/opt/SYMCScan/logs/spe.log"
echo "Esperando que se genere el archivo de log: $LOG_FILE"
while [ ! -f "$LOG_FILE" ]; do
  sleep 2
done

echo "Archivo de log detectado. Mostrando logs..."
tail -f "$LOG_FILE"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
#!/bin/bash

# Espera a que el log esté disponible
echo "Esperando a que se genere el archivo de log..."
while [ ! -f /opt/SYMCScan/logs/spe.log ]; do
  sleep 2
done

echo "Archivo de log encontrado. Mostrando logs:"
tail -f /opt/SYMCScan/logs/spe.log

CMD ["tail", "-f", "/opt/SYMCScan/logs/spe.log"]
export SYMANTEC_LICENSE_PATH=/opt/SYMScan/lic

/opt/SYMScan/bin/symcscan -config /opt/SYMScan/bin -daemon

/opt/Symantec/ssecls/ssecls \
-server "127.0.0.1:1344:0:false" \
-scantype F \
-mode scan \
-verbose \
/tmp/eicar.txt
#!/bin/bash

bash /tmp/SymantecProtectionEngine.sh <<EOF
yes
/opt/SymantecProtectionEngine
8004
8005
yes
EOF


COPY SymantecProtectionEngine.sh /tmp/SymantecProtectionEngine.sh
COPY silent_installer.sh /tmp/silent_installer.sh
RUN chmod +x /tmp/silent_installer.sh
RUN /tmp/silent_installer.sh

echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > test.com.txt

curl -o eicar.com.txt https://www.eicar.org/download/eicar.com.txt
/opt/SYMCScanEngine/bin/ssecls -a /ruta/al/archivo/eicar.com.txt
ssecls -a eicar.com.txt
find / -name ssecls 2>/dev/null

https://ftp.gnu.org/gnu/sharutils/sharutils-4.15.2.tar.xz


# 1. Descargar el código fuente
curl -LO https://ftp.gnu.org/gnu/sharutils/sharutils-4.15.2.tar.xz

# 2. Extraer
tar -xf sharutils-4.15.2.tar.xz
cd sharutils-4.15.2

# 3. Instalar dependencias de compilación
dnf install -y gcc make automake autoconf gettext-devel

# 4. Configurar, compilar e instalar
./configure
make
make install

curl -O http://vault.centos.org/7.9.2009/os/x86_64/Packages/sharutils-4.13.3-8.el7.x86_64.rpm
# Descargar e instalar sharutils manualmente (desde CentOS 7 repo)
RUN curl -O http://mirror.centos.org/centos/7/os/x86_64/Packages/sharutils-4.13.3-8.el7.x86_64.rpm && \
    rpm -i sharutils-4.13.3-8.el7.x86_64.rpm && \
    rm sharutils-4.13.3-8.el7.x86_64.rpm

FROM centos:7

# Instalar paquetes necesarios para SPE
RUN yum install -y \
    sharutils \
    glibc \
    initscripts \
    libuuid \
    unzip \
    wget \
    bash \
    && yum clean all

# Variable de entorno opcional para versión
ENV SPE_VERSION=9.2.1.7

# Copiar el ZIP de instalación de Symantec al contenedor
COPY Linux.zip /tmp/Linux.zip

# Extraer e instalar SPE
RUN unzip /tmp/Linux.zip -d /tmp/ \
    && chmod +x /tmp/SPE_NAS/Symantec_Protection_Engine/RedHat/SymantecProtectionEngine.sh \
    && /bin/bash /tmp/SPE_NAS/Symantec_Protection_Engine/RedHat/SymantecProtectionEngine.sh

# Exponer los puertos que SPE usa por defecto
EXPOSE 8004 8005

# Arranca en bash para pruebas
CMD ["bash"]

# RUN wget http://mirror.centos.org/centos/7/os/x86_64/Packages/sharutils-4.13.3-8.el7.x86_64.rpm \
#     && rpm -i sharutils-4.13.3-8.el7.x86_64.rpm

# # Usar imagen base Debian Bullseye
# FROM debian:bullseye

# # Instalar paquetes necesarios
# RUN apt-get update && apt-get install -y \
#     unzip \
#     wget \
#     bash \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Definir versión como variable de entorno (opcional)
# ENV SPE_VERSION=9.2.1.7

# # Copiar el archivo comprimido al contenedor
# COPY Linux.zip /tmp/Linux.zip

# # Extraer e instalar Symantec Protection Engine
# RUN unzip /tmp/Linux.zip -d /tmp/ \
#     && chmod +x /tmp/SPE_NAS/Symantec_Protection_Engine/RedHat/SymantecProtectionEngine.sh \
#     && /bin/bash /tmp/SPE_NAS/Symantec_Protection_Engine/RedHat/SymantecProtectionEngine.sh

# # Exponer puertos necesarios (ajustá si corresponde)
# EXPOSE 8004 8005
# SHELL ["/bin/bash", "-c"]

# Entrypoint si querés ejecutar el motor directamente
# ENTRYPOINT ["/opt/SymantecProtectionEngine/bin/spe"]

# Por ahora, abrir una shell para pruebas
CMD ["bash"]

# docker run -it --name symantec-lux-container symantec-lux /bin/bash

# docker build -t symantec-lux .
# docker run -d --name symantec-lux-container -p 1344:1344 symantec-lux
# # Imagen base compatible con RedHat
# FROM almalinux:9

# # Instalar dependencias necesarias
# RUN yum install -y \
#     sharutils \
#     glibc \
#     initscripts \
#     libuuid \
#     libuuid.i686 \
#     && yum clean all
# # Variables de entorno para evitar preguntas interactivas
# ENV APP_TYPE=NAS \
#     MACH_TYPE=x86_64

# # Copiar los archivos del instalador al contenedor
# COPY RedHat/SymantecProtectionEngine.sh /opt/SymantecProtectionEngine.sh

# # Dar permisos de ejecución al script
# RUN chmod +x /opt/SymantecProtectionEngine.sh

# # Ejecutar el script de instalación (automatizando respuestas con yes)
# RUN yes | /opt/SymantecProtectionEngine.sh

# # Exponer el puerto que use el motor (por ejemplo, 1344 para ICAP si aplica)
# EXPOSE 1344

# # Definir el entrypoint si el motor tiene un binario para ejecutarse
# CMD ["/opt/Symantec/ProtectionEngine/sbin/spe-start"]


# Hola Marian, como estas? 
# Lo del antivirus le dije a Sergio, ahora pongo por el chat donde estamos todos, no puedo bajar la app con ese link que mando:
# PONER_SCREEN_DONDE_FALLA_QUE_MANDE_A_SERGIO
# Y lo del PR en un rato tengo una reu con Esteban para ver eso y mergearlo de una vez, si estas libre podemos verlo sino, igual tengo a las 15 un check con Esteban y lo ibamos a ver ahiHola Marian, como estas? 
# Lo del antivirus le dije a Sergio, ahora pongo por el chat donde estamos todos, no puedo bajar la app con ese link que mando:
# PONER_SCREEN_DONDE_FALLA_QUE_MANDE_A_SERGIO
# Y lo del PR en un rato tengo una reu con Esteban para ver eso y mergearlo de una vez, si estas libre podemos verlo sino, igual tengo a las 15 un check con Esteban y lo ibamos a ver ahi# Usa una imagen base de Windows Server Core
# FROM mcr.microsoft.com/windows/servercore:ltsc2022

# # Establece el directorio de trabajo dentro del contenedor
# WORKDIR C:\app

# # Copia el contenido de la carpeta actual (donde está tu app) al contenedor
# COPY . .

# # (Opcional) Expón un puerto si tu app lo necesita
# # EXPOSE 8080

# # (Opcional) Define el comando para iniciar tu aplicación
# # Por ejemplo, si es una app .exe:
# # CMD ["C:\\app\\mi_app.exe"]


# Dale! Dame un min que estoy terminando algo del antivirus, si puedo te llamo en un ratito
# wHola Mirko! Nono, no cree ningun ticket para este cambio, tengo que crear uno por lo que veo no?, es para algo de kubernetes
# Team please, can you help me create a PR from this branch NOMBRE_BRANCH in to TrunK?, Im not able to create one for some reason, i think i need a ticketID from Jira

# kubectl get pod ar-service-67f84889f9-n2qm8 -n pcs -o jsonpath="{.metadata.ownerReferences[*].name}"
# kubectl get deployment ar-service -n pcs -o yaml > ar-service-deployment.yaml

# kubectl get pod clarity-backend-7b5d95c478-h2cqw -n lirmi-cl -o yaml

# kubectl get pod ar-service-67f84889f9-n2qm8 -n pcs -o json | jq '.metadata.finalizers'
# kubectl get pod ar-service-67f84889f9-n2qm8 -n pcs -o json | grep finalizers -A 5
# kubectl get pod ar-service-67f84889f9-n2qm8 -n pcs -o json

# #!/bin/bash

# # Simulación del comando 'watch' en Git Bash
# while true; do
#   clear
#   kubectl get pods
#   sleep 2
# done

# chmod +x watch-kube.sh

# nano ~/.bashrc

# alias watch-kube='bash /ruta/completa/a/watch-kube.sh'

# source ~/.bashrc

# locals {
# ${data.azurerm_user_assigned_identity.aks_identity.resource_group_name}
#   app_insights_name  = "${local.product}-${local.resource_group_location}-${local.environment}-appinsights"
#   app_insights_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Insights/components/${local.app_insights_name}"
# }
# kubectl create secret docker-registry regcred \
#   --docker-server=inverstan-docker-snapshot-local.docker.fis.dev \
#   --docker-username=TU_USUARIO \
#   --docker-password=TU_CONTRASEÑA \
#   --docker-email=TU_EMAIL
# FROM debian:bullseye

# # Instalar ClamAV y utilidades necesarias
# RUN apt-get update && apt-get install -y \
#     clamav \
#     clamav-daemon \
#     clamav-freshclam \
#     curl \
#     && rm -rf /var/lib/apt/lists/*

# # Actualizar definiciones de virus
# RUN freshclam

# # Exponer el puerto del servicio ClamAV
# EXPOSE 3310

# # Iniciar el servicio clamd al iniciar el contenedor
# CMD ["clamd", "-c", "/etc/clamav/clamd.conf"]

# # Imagen base oficial de Alpine con ClamAV
# FROM clamav/clamav:latest

# # Opcional: Actualiza los virus y deja el contenedor listo
# RUN freshclam

# # Exponer puertos si se usa como servicio
# EXPOSE 3310

# # Comando por defecto (puede variar según tu uso)
# CMD ["clamd"]
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: windows-test-deployment
#   labels:
#     app: windows-test
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: windows-test
#   template:
#     metadata:
#       labels:
#         app: windows-test
#     spec:
#       containers:
#         - name: windows-test
#           image: inverstan-docker-snapshot-local.docker.fis.dev/windows-test:latest
#           imagePullPolicy: Always
#       imagePullSecrets:
#         - name: regcred
Buen dia Marian!, dale excelente, dame un toque y si podes en 30 min nos juntamos, podes?
