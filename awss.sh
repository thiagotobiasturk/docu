#!/bin/bash

# Función para listar Lambdas
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
        aws lambda list-functions --output $outputFormat --region $region --profile PopularPSDevMB4Prototype-523008907015
    else
        aws lambda list-functions --output $outputFormat --profile PopularPSDevMB4Prototype-523008907015
    fi

    read -p "Press any key to continue or type 'exit' to exit: " exitOption
    if [[ $exitOption == "exit" ]]; then
        exit
    fi
}

# Función para listar APIs
List-APIs() {
    echo "Displaying APIs in JSON format."

    read -p "Do you want to filter by a region? (y/n): " regionOption
    if [[ $regionOption == "y" ]]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " apiOption

        case $apiOption in
            1) aws apigateway get-rest-apis --output json --region $region --profile PopularPSDevMB4Prototype-523008907015 ;;
            2) aws apigatewayv2 get-apis --output json --region $region --profile PopularPSDevMB4Prototype-523008907015 ;;
            *) echo "Invalid option for API type." ;;
        esac
    else
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " apiOption

        case $apiOption in
            1) aws apigateway get-rest-apis --output json --profile PopularPSDevMB4Prototype-523008907015 ;;
            2) aws apigatewayv2 get-apis --output json --profile PopularPSDevMB4Prototype-523008907015 ;;
            *) echo "Invalid option for API type." ;;
        esac
    fi

    read -p "Press any key to continue or type 'exit' to exit: " exitOption
    if [[ $exitOption == "exit" ]]; then
        exit
    fi
}

# Menú principal
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
