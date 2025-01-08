http://delivery.popular.com/secure/RapidBoard.jspa?rapidView=621&projectKey=MBM40&view=planning&issueLimit=100

cibp-bff-get-save-terms-and-conditions

provider "azurerm" {
  features {}
}
user: Alan.Duarte@popular.com
pass:  :6JrWnR_.!dQN36

# Crear un grupo de recursos en Azure
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "East US"
}
  tags = {
    BUC       = "4001.5223230.9822.0000.0000.3039"
    REQUESTOR = "Rachitha Tivakaran"
    SNOW      = "SCTASK21001790932"
    SPONSOR   = "John Zilinskis"
  }
}

# Crear un Service Bus Namespace
resource "azurerm_servicebus_namespace" "example" {
  name                = "my-servicebus-namespace"  # Nombre único para el namespace
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"  # Puede ser "Basic", "Standard", "Premium"
}

# Crear un Topic dentro del Service Bus Namespace
resource "azurerm_servicebus_topic" "example" {
  name                = "my-topic"
  namespace_name      = azurerm_servicebus_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
}

 # Opcional: Para autenticar con un Service Principal
  client_id       = "your-client-id"
  client_secret   = "your-client-secret"
  tenant_id       = "your-tenant-id"
  subscription_id = "your-subscription-id"
}

Downgrade a dependency: Reduced the version of [dependency_name] from [current_version] to [previous_version] to address [reason, e.g., compatibility issues].
Restore Dependabot configuration: Reverted Dependabot to its initial configuration to test whether it generates updates correctly after this change.
:6JrWnR_.!dQN36
Pablo, como estas? Perdona me surgio un tema y tengo que cortar ahora, cuando vuelva meto el cambio en TFE y te aviso cuando este desplegado.
Commented allow section to test PR creation for vulnerable dependency update and downgraded System.Text.Json to version 5.0.4
AzureMetrics
| where TimeGenerated > ago(7d)
| take 10

AzureDiagnostics
| where ResourceType == "APPLICATIONGATEWAYS"
| where TimeGenerated > ago(7d)
| take 10  // Muestra 10 registros para inspección


AzureDiagnostics
| where ResourceType == "APPLICATIONGATEWAYS"
| where TimeGenerated > ago(48h)
| project TimeGenerated, HttpStatusCode, RequestUri, ClientIp, Method
| summarize Count = count() by HttpStatusCode, RequestUri
| order by Count desc


# Definir el comando de AWS Lambda
$command = "aws lambda list-functions --output json --query 'Functions[].FunctionName' --profile my-profile"
}

function List-Lambdas {
    Write-Host "How would you like to display the Lambdas?"
    Write-Host "1 - JSON"
    Write-Host "2 - Table"
    $formatOption = Read-Host "Choose an option"

    switch ($formatOption) {
        1 { $outputFormat = "json" }
        2 { $outputFormat = "table" }
        default { Write-Host "Invalid option. Defaulting to JSON."; $outputFormat = "json" }
    }

    $regionOption = Read-Host "Do you want to filter by a region? (y/n)"
    if ($regionOption -eq "y") {
        $region = Read-Host "Enter the AWS region (e.g., us-east-1)"
    }

    # Inicializamos el array donde almacenaremos las funciones Lambda
    $lambdas = @()
    $nextMarker = $null

    do {
        Write-Host "Fetching Lambda functions..."

        # Hacer la llamada a AWS Lambda para obtener funciones, pasando el NextMarker si existe
        if ($region) {
            $response = aws lambda list-functions --output json --region $region --starting-token $nextMarker
        } else {
            $response = aws lambda list-functions --output json --starting-token $nextMarker
        }

        # Convertir la respuesta a un objeto JSON
        $jsonResponse = $response | ConvertFrom-Json

        # Agregar las funciones obtenidas a la lista
        $lambdas += $jsonResponse.Functions

        # Actualizar el NextMarker si hay más funciones
        $nextMarker = $jsonResponse.NextMarker

    } while ($nextMarker)  # Continuar si hay más funciones disponibles (paginas)

    # Si el formato es JSON, exportamos las funciones a un archivo CSV
    if ($outputFormat -eq "json") {
        $lambdas | Select-Object FunctionName, Runtime, LastModified | Export-Csv -Path "lambdas_list.csv" -NoTypeInformation
        Write-Host "Lambda functions saved to lambdas_list.csv"
    } else {
        # Si el formato es tabla, mostramos las funciones en pantalla
        $lambdas | Format-Table FunctionName, Runtime, LastModified
    }

    $exitOption = Read-Host "Press any key to continue or type 'exit' to exit"
    if ($exitOption -eq "exit") { exit }
}

function List-APIs {
    Write-Host "Displaying APIs in JSON format."

    $regionOption = Read-Host "Do you want to filter by a region? (y/n)"
    if ($regionOption -eq "y") {
        $region = Read-Host "Enter the AWS region (e.g., us-east-1)"
        Write-Host "1 - List REST APIs"
        Write-Host "2 - List HTTP APIs"
        $apiOption = Read-Host "Choose an option"

        if ($apiOption -eq "1") {
            aws apigateway get-rest-apis --output json --region $region
        } elseif ($apiOption -eq "2") {
            aws apigatewayv2 get-apis --output json --region $region
        } else {
            Write-Host "Invalid option for API type."
        }
    } else {
        Write-Host "1 - List REST APIs"
        Write-Host "2 - List HTTP APIs"
        $apiOption = Read-Host "Choose an option"

        if ($apiOption -eq "1") {
            aws apigateway get-rest-apis --output json
        } elseif ($apiOption -eq "2") {
            aws apigatewayv2 get-apis --output json
        } else {
            Write-Host "Invalid option for API type."
        }
    }

    $exitOption = Read-Host "Press any key to continue or type 'exit' to exit"
    if ($exitOption -eq "exit") { exit }
}

while ($true) {
    Write-Host "======================="
    Write-Host " AWS CLI Utility Menu"
    Write-Host "======================="
    Write-Host "1 - List Lambda Functions"
    Write-Host "2 - List API Gateway APIs"
    Write-Host "3 - Exit"
    $option = Read-Host "Choose an option"

    switch ($option) {
        1 { List-Lambdas }
        2 { List-APIs }
        3 { Write-Host "Exiting..."; exit }
        default { Write-Host "Invalid option, please choose 1, 2, or 3." }
    }
}
