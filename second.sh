#!/bin/bash

# Función para listar Lambdas y sus APIs asociadas
List-Lambda-APIs() {
    echo "Fetching Lambda functions and their associated APIs..."
    read -p "Do you want to filter by a region? (y/n): " regionOption

    if [[ $regionOption == "y" ]]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        lambdas=$(aws lambda list-functions --query 'Functions[].FunctionName' --output text --region $region --profile PopularPSDevMB4Prototype-523008907015)
    else
        lambdas=$(aws lambda list-functions --query 'Functions[].FunctionName' --output text --profile PopularPSDevMB4Prototype-523008907015)
    fi

    if [[ -z "$lambdas" ]]; then
        echo "No Lambda functions found."
        return
    fi

    echo "Lambda Functions and Associated APIs:"
    for lambda in $lambdas; do
        echo "----------------------------------------"
        echo "Lambda: $lambda"
        
        # Obtener el ARN de la Lambda
        if [[ $regionOption == "y" ]]; then
            arn=$(aws lambda get-function --function-name "$lambda" --query 'Configuration.FunctionArn' --output text --region $region --profile PopularPSDevMB4Prototype-523008907015)
        else
            arn=$(aws lambda get-function --function-name "$lambda" --query 'Configuration.FunctionArn' --output text --profile PopularPSDevMB4Prototype-523008907015)
        fi

        # Buscar APIs asociadas a la Lambda en API Gateway
        if [[ $regionOption == "y" ]]; then
            apis=$(aws apigateway get-rest-apis --query "items[?contains(description, '$arn')].{Name:name, ID:id}" --output table --region $region --profile PopularPSDevMB4Prototype-523008907015)
        else
            apis=$(aws apigateway get-rest-apis --query "items[?contains(description, '$arn')].{Name:name, ID:id}" --output table --profile PopularPSDevMB4Prototype-523008907015)
        fi

        if [[ -z "$apis" ]]; then
            echo "No APIs associated with this Lambda."
        else
            echo "APIs Associated:"
            echo "$apis"
        fi
    done

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
    echo "3 - View Lambda Function Names"
    echo "4 - View Lambdas and Associated APIs"
    echo "5 - Exit"
    read -p "Choose an option: " option

    case $option in
        1) List-Lambdas ;;
        2) List-APIs ;;
        3) View-Function-Names ;;
        4) List-Lambda-APIs ;;
        5) echo "Exiting..."; exit ;;
        *) echo "Invalid option, please choose 1, 2, 3, 4, or 5." ;;
    esac
done
