{
  "MetricsProviders": {
    "Providers": [
      {
        "Name": "ExampleProvider",
        "Data": [
          {
            "InstrumentationKey": "example-key",
            "EndpointAddress": "example-endpoint",
            "Location": "example-location"
          }
        ]
      }
    ]
  }
}

  
  pcs_config = jsondecode(data.local_file.pcs_config.content)


# Variables y configuración

variable "servicebus_ns_sku" {
  description = "The SKU (pricing tier) for the Service Bus Namespace (default: Standard)"
  type        = string
  default     = "Standard"
}

variable "servicebus_queue_max_size_in_megabytes" {
  description = "The maximum size for the Service Bus Queue in megabytes (default: 1024)"
  type        = number
  default     = 1024
  validation {
    condition     = var.servicebus_queue_max_size_in_megabytes >= 1024 && var.servicebus_queue_max_size_in_megabytes <= 8192
    error_message = "The max size must be between 1024 and 8192 megabytes."
  }
}

variable "servicebus_queue_lock_duration" {
  description = "The lock duration for the Service Bus Queue (default: PT5M, which is 5 minutes)"
  type        = string
  default     = "PT5M"
}

variable "servicebus_queue_default_message_ttl" {
  description = "The default time-to-live (TTL) for messages in the Service Bus Queue (default: P14D, which is 14 days)"
  type        = string
  default     = "P14D"
}

locals {
  namespace_name = format("%s-namespace", var.name_format)
  queues = {
    queue1 = {
      name                = format("%s-queue1", var.name_format)
      max_size_in_megabytes = var.servicebus_queue_max_size_in_megabytes
      lock_duration       = var.servicebus_queue_lock_duration
      default_message_ttl = var.servicebus_queue_default_message_ttl
    }
  }
}

# Crear el namespace
resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                = local.namespace_name
  location            = var.main_resource_group_location
  resource_group_name = var.main_resource_group_name
  sku                 = var.servicebus_ns_sku
  tags                = var.base_tags
}

# Crear las colas
resource "azurerm_servicebus_queue" "servicebus_queue" {
  for_each            = local.queues
  name                = each.value.name
  namespace_id        = azurerm_servicebus_namespace.servicebus_namespace.id
  max_size_in_megabytes = each.value.max_size_in_megabytes
  lock_duration       = each.value.lock_duration
  default_message_ttl = each.value.default_message_ttl
  depends_on          = [azurerm_servicebus_namespace.servicebus_namespace]
}

# Crear la regla de autorización
resource "azurerm_servicebus_namespace_authorization_rule" "servicebus_rule" {
  name                = "example-authorization-rule"
  namespace_name      = azurerm_servicebus_namespace.servicebus_namespace.name
  resource_group_name = var.main_resource_group_name
  rights              = ["Listen", "Send", "Manage"]
}

# Outputs
output "servicebus_namespace_name" {
  description = "The name of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.servicebus_namespace.name
}

output "servicebus_namespace_id" {
  description = "The ID of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.servicebus_namespace.id
}

output "servicebus_queue_names" {
  description = "The names of the Service Bus Queues"
  value       = [for queue in azurerm_servicebus_queue.servicebus_queue : queue.name]
}

output "servicebus_queue_ids" {
  description = "The IDs of the Service Bus Queues"
  value       = [for queue in azurerm_servicebus_queue.servicebus_queue : queue.id]
}

output "servicebus_primary_key" {
  description = "The primary key of the Service Bus authorization rule"
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_rule.primary_key
}

output "servicebus_secondary_key" {
  description = "The secondary key of the Service Bus authorization rule"
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_rule.secondary_key
}
























output "servicebus_primary_key" {
  value = azurerm_servicebus_namespace_authorization_rule.example.primary_key
}

output "servicebus_secondary_key" {
  value = azurerm_servicebus_namespace_authorization_rule.example.secondary_key
}


resource "azurerm_servicebus_namespace_authorization_rule" "servicebus_rule" {
  name                = "example-authorization-rule"
  namespace_name      = azurerm_servicebus_namespace.servicebus_namespace.name
  resource_group_name = azurerm_servicebus_namespace.servicebus_namespace.resource_group_name
  rights              = ["Listen", "Send", "Manage"]
}


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
