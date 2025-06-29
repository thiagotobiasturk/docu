Título del bug:
Navegación con flechas del navegador permite volver a la aplicación sin estar autenticado

Descripción:
Luego de iniciar sesión en BBVA Prendarios y acceder a la pantalla principal de concesionarios, si el usuario utiliza la flecha de "atrás" del navegador, es redirigido correctamente a la pantalla de login. Sin embargo, si posteriormente presiona la flecha de "adelante" del navegador, puede volver a la pantalla de concesionarios sin necesidad de haberse autenticado nuevamente.

Este comportamiento representa un problema de seguridad, ya que permite acceder a partes de la aplicación sin una sesión activa.

Pasos para reproducir:

Iniciar sesión en BBVA Prendarios con credenciales válidas.

Acceder a la pantalla de concesionarios.

Presionar la flecha "atrás" del navegador → el sistema redirige al login (esperado).

Presionar la flecha "adelante" del navegador → el sistema permite el acceso a concesionarios sin necesidad de login (no esperado).

Resultado esperado:
Al presionar la flecha "adelante", el sistema debería verificar si hay una sesión activa. Si no la hay, debería mantenerse en la pantalla de login.

Resultado actual:
El sistema permite el acceso a la pantalla de concesionarios sin autenticación al usar la navegación del navegador.


La pantalla debe mostrar debajo del header, los links de descarga de formularios, que deberán estar ordenados en dos columnas: una titulada “nombre” y otra “acción” (la acción siempre es la misma → descargar). Todos los archivos deberán descargarse en formato PDF.
Se deberán visualizar todos los formularios que se detallan a continuación. Se mostrará una solicitud de tasa fija o UVA, dependiendo de la oferta comercial que eligió el cliente en la pantalla de ofertas disponibles.
Solicitud de Préstamos Prendario y Caja de Ahorro en pesos (Tasa fija) o Solicitud de Préstamos Prendario UVA y Caja de Ahorro en pesos (UVA)
Solicitud de Seguro Automotor
Información Comercial
Coberturas BBVA 122016 (dejar el link de descarga actualizado)
      3. Luego de descargar los formularios correspondientes, el vendedor al ejecutar continuar será redirigido a la pantalla de Legajo Digital.

 Scenario: Visualizar formularios por Nombre y Accion
Given que el usuario se encuentra en la pantalla de Descarga de formularios
Then debajo del Header se debe visualizar los formularios ordenados en dos columnas por Nombre y 
Accion:
| Nombre                                                                 | Accion          |
| Solicitud de Préstamos Prendario y Caja de Ahorro en pesos (Tasa fija) | Descargar       |
o Solicitud de Préstamos Prendario UVA y Caja de Ahorro en pesos (UVA)
| Solicitud de Seguro Automotor                                          | Descargar       | 
| Información Comercial                                                  | Descargar       |
| Coberturas BBVA 122016 (dejar el link de descarga actualizado)         | Descargar       |
When el usuario descarga los formularios                                 
Then los formularios deben estar en formato PDF

Scenario: Usuario es redirigido a la pantalla de Legajo Digital
Given que el usuario se encuentra en la pantalla de Descarga de formularios
And Ah visualizado y descargado los formularios
When hace clic en "Continuar"
Then el sistema debe redirigir al usuario a la pantalla de "Legajo Digital"





Scenario: Selección del tipo de cotitular y asignación automática del estado civil
Given que el usuario se encuentra en la pantalla "Datos adicionales del cotitular"
When selecciona el "Tipo de Cotitular"
  | Opción    |
  | Cónyuge   |
  | Cotitular |
Then si selecciona "Cónyuge", el estado civil debe asignarse automáticamente como "Casado"
And si selecciona "Cotitular", el estado civil debe copiar el valor de los "Datos adicionales del titular"



Scenario: Visualización y carga de campos obligatorios del cotitular
Given que el usuario se encuentra en la pantalla "Datos adicionales del cotitular"
Then debe visualizar y completar los siguientes campos:
  | Campo                           | Tipo            | Observaciones                                             |
  | País de nacimiento              | Autocompletado  | Ídem datos del titular                                    |
  | Identificación Fiscal o Tributaria | Desplegable + numérico | CUIL o CDI, 11 dígitos, con guiones                |
  | Condición ante IVA             | Desplegable     | Opciones excluyentes: Resp Inscripto, Exento, etc.        |
  | Email                           | Autocompletado  | Ídem datos del titular, hasta 50 caracteres               |
  | Teléfono celular                | Editable        | Código de área (hasta 4) + número (hasta 8 dígitos)       |


Scenario: Visualización del campo ¿Es PEP? en datos complementarios del cotitular
Given que el usuario se encuentra en la pantalla "Datos adicionales del cotitular"
Then debe visualizar la pregunta "¿Es PEP?" con las opciones "Sí" o "No"
And por defecto debe estar seleccionada la opción "No"


Scenario: Visualización de campos de autodeclaración del cotitular
Given que el usuario se encuentra en la pantalla "Datos adicionales del cotitular"
Then debe visualizar la pregunta "¿Es sujeto obligado?" con opciones "Sí" o "No" (por defecto "No")
And si selecciona "Sí", debe habilitarse el campo "¿Presentó constancia?" con opciones "Sí" o "No" (por defecto "No")
And debe visualizar el campo "Rol del firmante" como obligatorio con opciones "Cotitular" o "Cónyuge"

2.1 Datos Cotitular 

 

Tipo de Cotitular→ campo mandatorio y desplegable con opción: cónyuge o cotitular.
 

-->Si es cónyuge, el estado civil por default es casado.

-->Si es cotitular, el estado civil es ídem DATOS ADICIONALES TITULAR

 

País de nacimiento → Ídem DATOS ADICIONALES TITULAR
 

Identificación Fiscal o Tributaria →  Ídem DATOS ADICIONALES TITULAR
 

Condición ante IVA→  campo mandatorio, desplegable con opción excluyente:  Resp Inscripto/Exento/No respons/Consumidor/Resp Monotributo/Ingresos Brutos Nro (Provincia)/Pequeño Contr Eventual.
 

Email→  Ídem DATOS ADICIONALES TITULAR
 

Teléfono celular→  Ídem DATOS ADICIONALES TITULAR
 

2.2 Datos Complementarios 

Se deberá visualizar la pregunta ¿Es PEP? –>Ídem DATOS ADICIONALES TITULAR

 

2.3 Autodeclaración Individuos

Que se visualice Sujeto Obligado→ Ídem DATOS ADICIONALES TITULAR

Se deberá visualizar la pregunta ¿Presentó constancia?→Ídem DATOS ADICIONALES TITULAR

Rol del firmante→ campo mandatorio y con opción Cotitular o Cónyuge.












Feature: Validación de domicilio particular

Scenario: Mostrar mensaje si el domicilio es distinto al del DNI
  Given el usuario desmarca el checkbox "Domicilio igual al del DNI"
  Then el sistema debe solicitar al vendedor un comprobante de servicio
    And se debe generar un requisito "SERVICIO" en el Legajo Digital

Scenario: Autocompletado de Provincia y Localidad por CP
  Given el usuario ingresa un Código Postal
  Then el sistema debe autocompletar Provincia y Localidad filtrando por CP

Scenario: Validación de campos Calle y Número
  Given el usuario comienza a escribir el nombre de la calle
  When ingresa al menos 3 letras
  Then debe mostrarse un desplegable con opciones de calles de esa localidad
    And debe autocompletarse al presionar Enter
    And el desplegable debe ajustar el ancho al contenido más largo

Scenario: Validación de Piso y Departamento
  Given el usuario completa los datos de calle y número
  Then puede ingresar un piso de hasta 2 dígitos
    And puede ingresar un departamento con letras o dígitos



Feature: Carga de datos de Caja de Ahorro

Scenario: Mostrar cuentas existentes si elige cuenta existente
  Given el usuario marca la opción "Cuenta existente"
  Then se deben mostrar en un desplegable todas las cuentas habilitadas
    And solo deben ser de tipo "Caja de Ahorro"

Scenario: Mostrar sucursales si elige nueva cuenta
  Given el usuario marca la opción "Cuenta nueva"
  Then debe visualizar un desplegable con las sucursales disponibles
    And debe poder seleccionar una
    And debe visualizar un link de ayuda a un buscador de sucursales

Feature: Carga de datos del vehículo

Scenario: Validar campos si el vehículo es usado
  Given el usuario selecciona "Vehículo usado"
  Then debe completar los campos:
    | Campo       | Formato                                 |
    | Patente     | AA123BB (sin letras I y O)              |
    | Motor nro.  | 17 dígitos alfanuméricos                |
    | Chasis nro. | 17 dígitos alfanuméricos (sin I, O, Q)  |

Scenario: Validar campos si el vehículo es nuevo
  Given el usuario selecciona "Vehículo nuevo"
  Then debe completar los campos:
    | Campo       | Formato                                 |
    | Motor nro.  | 17 dígitos alfanuméricos                |
    | Chasis nro. | 17 dígitos alfanuméricos (sin I, O, Q)  |

Feature: Carga de datos complementarios

Scenario: Validar selección de campo PEP
  Given el usuario está en la sección de Datos Complementarios
  Then debe visualizar el campo "¿Es PEP?" con opciones Sí o No
    And por defecto debe estar en "No"


Feature: Autodeclaración de individuos

Scenario: Validar campo Sujeto Obligado
  Given el usuario está en la sección de Autodeclaración
  Then debe visualizar el campo "Sujeto Obligado" con opciones Sí o No
    And por defecto debe estar en "No"

Scenario: Mostrar campo Presentó constancia solo si es Sujeto Obligado
  Given el usuario selecciona "Sí" en "Sujeto Obligado"
  Then debe habilitarse el campo "¿Presentó constancia?"
    And debe ser obligatorio y por defecto estar en "No"

Scenario: Ocultar campo Presentó constancia si no es Sujeto Obligado
  Given el usuario selecciona "No" en "Sujeto Obligado"
  Then el campo "¿Presentó constancia?" no debe estar visible ni habilitado







1.1 Datos Personales del Titular 

 

Estado Civil → campo mandatorio, desplegable, por default queda soltero, sino con opciones:  casado/a, viudo/a, divorciado/a, conviviente.
 

→ Si el titular es casado debe desplegarse un combo para la carga de 4 datos del cónyuge: 

 

Nombre: campo mandatorio, editable. Admite más de un nombre.
Apellido: campo mandatorio, editable. Admite más de un apellido.
Tipo:  campo mandatorio, no editable. Solo incluye DNI.
Número de Documento:  campo mandatorio y numérico, con un máximo de 8 dígitos. Si el número a ingresar es de 7 caracteres, el sistema deberá asumir que el primer carácter es = 0 (cero). La numeración con que empieza el documento indican si es DNI o DNE. Validar que la numeración mayor a 90 millones corresponde a DNE.
 

País de nacimiento → este dato viene de pantalla de inicio. 
 

Identificación Fiscal o Tributaria → campo numérico y mandatorio, desplegable con opción de  CUIL o CDI y a continuación número de máximo 11 dígitos, separados por guiones los 2 primeros del último.
 

Teléfono celular→ campo mandatorio y editable. Colocar código de área (hasta 4 dígitos) +  número del celular (hasta 8 dígitos). 
 

Email→ campo que se va a autocompletar cuando se cargue el e-mail en la pantalla de simulación, con @ en el medio. Hasta 50 caracteres. 
 

1.2 Domicilio Particular 

Debe existir un checkbox donde tildar si el domicilio real es igual o distinto al que tiene descripto en el DNI. 

Si el domicilio difiere deberá dar aviso al vendedor que debe solicitar un servicio de luz, gas, teléfono o algún servicio que demuestre domicilio real.

El sistema creará automáticamente un requisito en el Legajo Digital “SERVICIO”.

Los campos no se deberán poder modificar.

Provincia→ se autocompleta de acuerdo al CP que se cargó previamente. Campo mandatorio, desplegable. Se muestran las de Argentina.
Localidad→ se autocompleta de acuerdo al CP que se cargó previamente. Campo mandatorio, desplegable. Se muestran filtradas de acuerdo a la provincia.
Calle y número→ campo mandatorio, con desplegable: uno para el nombre de la calle, otro para el número y otros dos para: piso y departamento.  Se valida contra el CP. El desplegable (la lista de opciones que aparece al escribir) debe ajustar su ancho al contenido más largo de las opciones, de forma que no se corte ninguna.
-->Ingresando las tres primeras letras de la calle, nos debe mostrar todas las calles con esas letras de esa localidad y completar el nombre entero al ejecutar "Enter". 

-->Se debe además cargar la numeración de la calle como texto e ingreso de dígitos. 

-->Si es departamento, colocar piso con máximo de 2 dígitos y departamento en dígitos o letras. 

 

1.3 Datos Caja de Ahorro

Checkbox: nueva o existente
Si es existente:

Se deben mostrar todas las cuentas abiertas y habilitadas que tiene el cliente en un desplegable.

Número de Caja de ahorro→ campo desplegable, que muestra los números de cuenta de caja de ahorro, e incluyen el número de sucursales habilitadas que tiene el cliente. No puede ser cuenta corriente.
Si es nueva:

Se deben mostrar:

Número de Sucursal→ campo desplegable, scrolear y que muestra los números de sucursales habilitadas y el nombre de la misma para que el nuevo cliente elija donde quiere que le abran la cuenta. (Agregar un link de ayuda a un buscador de sucursales).
 

1.4 Datos del vehículo (ya sea auto/moto/camión)

 

Si es usado se deben mostrar: 

1.Patente→ campo mandatorio y editable, con formato de: dos letras (A-Z, excluyendo I y O), tres números (0-9), dos letras (A-Z, excluyendo I y O).

2.Motor nro.→ campo mandatorio y editable, compuesto por 17 dígitos alfanuméricos. 

3.Chasis nro.→ campo mandatorio y editable, compuesto por 17 dígitos alfanuméricos. No usa las letras I, O y Q para evitar confusiones con los números 1, 0 y 6. 

 

Si es nuevo  se deben mostrar: 

1.Motor nro.→ campo mandatorio y editable, compuesto por 17 dígitos alfanuméricos. 

2.Chasis nro.→ campo mandatorio y editable, compuesto por 17 dígitos alfanuméricos. No usa las letras I, O y Q para evitar confusiones con los números 1, 0 y 6. 

 

1.6 Datos Complementarios 

Se deberá visualizar la pregunta ¿Es PEP? –> campo mandatorio y con opción Sí o No. Por default queda en No.

 

1.7 Autodeclaración Individuos

Que se visualice Sujeto Obligado→ campo mandatorio y con opción Sí o No. Por default queda en No.

Se deberá visualizar la pregunta ¿Presentó constancia?→ campo mandatorio y con opción Sí o No. Debe habilitarse solo si es sujeto obligado. Por default queda en No.

https://meet.google.com/gdq-ezhw-xqx
Scenario: Usuario accede a Cuadro de Marcha al hacer clic en "Continuar" en Cotización de seguro
Given que el usuario se encuentra en la pantalla de Cotización de seguro
When ha completado los datos para calcular la Cotización de seguro
When hace clic en "Continuar"
Then el usuario debe ser redirigido a la pantalla "Cuadro de Marcha"

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
