pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org PyAutoGUI
("xoxp-6209710763493-6236228023216-8684558229795-24d8ae58829a629d0ae9967aa74f6000")
setup.exe /Action=Install /MediaPath="C:\SQL2017\"
netsh advfirewall firewall show rule name=all | findstr 1444
netsh advfirewall firewall show rule name="SQL SERVER 2017-1444" verbose
Test-NetConnection -ComputerName 10.0.2.15 -Port 1444
netsh advfirewall set allprofiles state off
docker pull mcr.microsoft.com/mssql/server:2019-latest
Get-ChildItem "C:\Program Files" -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "*Reporting*" }


# Cambia estas variables con tu información
$serverName = "DESKTOP-5V0E01L"
$databaseName = "ReportServer_Automatico"
$sqlUser = "usuario_sql"
$sqlPassword = "contraseña123"

# Ruta de rsconfig.exe (ajusta la versión si usas otra)
$rsconfigPath = "C:\Program Files\Microsoft SQL Server\150\Tools\Binn\rsconfig.exe"

# Comando para configurar la conexión
Start-Process -FilePath $rsconfigPath -ArgumentList "-c -s $serverName -d $databaseName -a SQL -u $sqlUser -p $sqlPassword" -Wait



docker exec -it sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "YourStrong!Passw0rd"
SELECT @@VERSION;
GO
http://localhost:8080
Get-ChildItem -Path C:\ -Recurse -Include *ReportServer*.exe -ErrorAction SilentlyContinue

docker run -d -p 8080:80 --name myapp testapp


# Usa una imagen base de Windows con PowerShell
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Copia los scripts al contenedor
COPY download.ps1 C:/scripts/download.ps1
COPY install-ssrs.ps1 C:/scripts/install-ssrs.ps1

# Establece el directorio de trabajo
WORKDIR C:/scripts

# Ejecuta ambos scripts
RUN powershell -ExecutionPolicy Bypass -File download.ps1 && \
    powershell -ExecutionPolicy Bypass -File install-ssrs.ps1

    Test-Path "C:\Users\Thiago\Desktop\TestingSSRS\SQLServerReportingServices"
Test-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft SQL Server Reporting Services"
True


docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=StrongPassword34" \
   -p 1433:1433 --name sqlserver \
   -d mcr.microsoft.com/mssql/server:2019-latest

docker pull mcr.microsoft.com/mssql/server:2019-CU16-windowsservercore-ltsc2019

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=YourStrong!Passw0rd" \
   -p 1433:1433 --name sqlserver \
   -d mcr.microsoft.com/mssql/server:2017-latest

   docker pull mcr.microsoft.com/mssql/server:2019-windows

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=1234" `
   -p 1433:1433 --name sqlserver `
   -d mcr.microsoft.com/mssql/server:2019-windows


netstat -ano | findstr LISTENING | findstr 1444

apiVersion: v1
kind: Pod
metadata:
  name: windows-hang-pod
spec:
  nodeSelector:
    kubernetes.io/os: windows
  containers:
  - name: windows-container
    image: mcr.microsoft.com/windows/servercore:ltsc2022
    command: ["powershell.exe", "-Command", "Start-Sleep -s 3600"]
  restartPolicy: Always

apiVersion: v1
kind: Pod
metadata:
  name: windows-pvc-pod
spec:
  nodeSelector:
    kubernetes.io/os: windows
  volumes:
  - name: test-volume
    persistentVolumeClaim:
      claimName: windows-test-pvc
  containers:
  - name: windows-container
    image: mcr.microsoft.com/windows/servercore:ltsc2022
    command: ["ping", "-t", "localhost"]
    volumeMounts:
    - mountPath: "/data"
      name: test-volume
  restartPolicy: Always


apiVersion: v1
kind: Pod
metadata:
  name: windows-test-pod
spec:
  nodeSelector:
    kubernetes.io/os: windows
  containers:
  - name: windows-container
    image: mcr.microsoft.com/windows/servercore:ltsc2022
    command: ["ping", "-t", "localhost"]  # Mantiene el contenedor en ejecución
  restartPolicy: Always


kubectl apply -f windows-pod.yaml
kubectl get pods
kubectl delete pod windows-test-pod
kubectl delete pod windows-test-pod --grace-period=0 --force
kubectl get pod windows-test-pod -o json | jq .metadata.finalizers
kubectl describe pod windows-test-pod
kubectl logs windows-test-pod --previous



kubectl get secret svc-invs-artifactory-new -o jsonpath='{.data.\.dockerconfigjson}' | base64 --decode
kubectl rollout restart deployment reports-api-deployment -n bold-services
wget -qO- http://10.33.52.250
wget -qO- http://reports-api-service:80
kubectl run testpod --image=busybox --restart=Never --rm -it -- /bin/sh


Steven my friend, i change the meeting for tomorrow, sorry i need to finish related to github repo for the Engineering team. Is that ok

Steven, im so sorry, i totally forgot about our meeting, i need to drop to take my daughter to a medical control, lets have our meeting next week, is that ok?
- name: Force TLS 1.2
  run: |
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  shell: pwsh
- name: Clear NuGet Cache
  run: nuget locals all -clear


Crear un PR, informando
Name: " Setup-nuget is not working, need to update version"
Description:
" Last running versions are falling or taking forever to finish:"
(Agregar screen del error)
" Last time this step works, we had the information that it will be deprecated soon:"
(Agregar screen de que se esta por deprecarse)
" Updated to next version:"
(Screen de nueva version usada)

#!/bin/bash
variable "app_insights_scope" {
  description = "Ruta del componente de Application Insights"
  type        = string
  default     = "/subscriptions/c2ac73e0-b73d-4485-8ffb-45314b27f272/resourceGroups/sdl-resources-investran-dev-eus2/providers/Microsoft.Insights/components/pcs-eastus2-dev-appinsights"
}

json_to_csv() {
    input_json=$1
    output_csv=$2

    if ! command -v jq &> /dev/null; then
        echo "jq no está instalado. Por favor instálalo para convertir JSON a CSV."
        exit 1
    fi

    jq -r '[.[] | to_entries | map(.value) | @csv] | .[]' $input_json > $output_csv
    echo "Resultado guardado en $output_csv"
}

List-Lambdas() {
    echo "How would you like to display the Lambdas?"
    echo "1 - JSON"
    echo "2 - Table"
    read -p "Choose an option: " formatOption

    case $formatOption in
        1) outputFormat="json" ;;
        2) outputFormat="table" ;;
        *) echo "Invalid option. Defaulting to JSON."; outputFormat="json" ;;
    esac

    read -p "Do you want to filter by a region? (y/n): " regionOption
    if [[ $regionOption == "y" ]]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        result_file="lambdas_$region.csv"
        aws lambda list-functions --output $outputFormat --region $region --profile PopularPSDevMB4Prototype-523008907015 > lambdas.json
    else
        result_file="lambdas_all.csv"
        aws lambda list-functions --output $outputFormat --profile PopularPSDevMB4Prototype-523008907015 > lambdas.json
    fi

    json_to_csv lambdas.json $result_file
    rm lambdas.json  

    read -p "Press any key to continue or type 'exit' to exit: " exitOption
    if [[ $exitOption == "exit" ]]; then
        exit
    fi
}

List-APIs() {
    echo "Displaying APIs in JSON format."

    read -p "Do you want to filter by a region? (y/n): " regionOption
    if [[ $regionOption == "y" ]]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " apiOption

        case $apiOption in
            1) result_file="rest_apis_$region.csv"
               aws apigateway get-rest-apis --output json --region $region --profile PopularPSDevMB4Prototype-523008907015 > apis.json ;;
            2) result_file="http_apis_$region.csv"
               aws apigatewayv2 get-apis --output json --region $region --profile PopularPSDevMB4Prototype-523008907015 > apis.json ;;
            *) echo "Invalid option for API type." ;;
        esac
    else
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " apiOption

        case $apiOption in
            1) result_file="rest_apis_all.csv"
               aws apigateway get-rest-apis --output json --profile PopularPSDevMB4Prototype-523008907015 > apis.json ;;
            2) result_file="http_apis_all.csv"
               aws apigatewayv2 get-apis --output json --profile PopularPSDevMB4Prototype-523008907015 > apis.json ;;
            *) echo "Invalid option for API type." ;;
        esac
    fi

    json_to_csv apis.json $result_file
    rm apis.json  

    read -p "Press any key to continue or type 'exit' to exit: " exitOption
    if [[ $exitOption == "exit" ]]; then
        exit
    fi
}


while true; do
    echo "======================="
    echo " AWS CLI Utility Menu"
    echo "======================="
    echo "1 - List Lambda Functions"
    echo "2 - List API Gateway APIs"
    echo "3 - Exit"
    read -p "Choose an option: " option

    case $option in
        1) List-Lambdas ;;
        2) List-APIs ;;
        3) echo "Exiting..."; exit ;;
        *) echo "Invalid option, please choose 1, 2, or 3." ;;
    esac
done
