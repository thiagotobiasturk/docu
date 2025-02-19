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
