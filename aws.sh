#!/bin/bash

# Function to list Lambda functions
list_lambdas() {
    echo "How would you like to display the Lambdas?"
    echo "1 - JSON"
    echo "2 - Table"
    read -p "Choose an option: " format_option

    # Set the output format based on user input
    case $format_option in
        1) OUTPUT_FORMAT="json" ;;
        2) OUTPUT_FORMAT="table" ;;
        *) echo "Invalid option. Defaulting to JSON."; OUTPUT_FORMAT="json" ;;
    esac

    # Ask if they want to specify a region
    read -p "Do you want to filter by a region? (y/n): " region_option
    if [ "$region_option" == "y" ]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        aws lambda list-functions --output $OUTPUT_FORMAT --region $region
    else
        aws lambda list-functions --output $OUTPUT_FORMAT
    fi
}

# Function to list APIs from API Gateway
list_apis() {
    echo "How would you like to display the APIs?"
    echo "1 - JSON"
    echo "2 - Table"
    read -p "Choose an option: " format_option

    # Set the output format based on user input
    case $format_option in
        1) OUTPUT_FORMAT="json" ;;
        2) OUTPUT_FORMAT="table" ;;
        *) echo "Invalid option. Defaulting to JSON."; OUTPUT_FORMAT="json" ;;
    esac

    # Ask if they want to specify a region
    read -p "Do you want to filter by a region? (y/n): " region_option
    if [ "$region_option" == "y" ]; then
        read -p "Enter the AWS region (e.g., us-east-1): " region
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " api_option

        if [ "$api_option" == "1" ]; then
            aws apigateway get-rest-apis --output $OUTPUT_FORMAT --region $region
        elif [ "$api_option" == "2" ]; then
            aws apigatewayv2 get-apis --output $OUTPUT_FORMAT --region $region
        else
            echo "Invalid option for API type."
        fi
    else
        echo "1 - List REST APIs"
        echo "2 - List HTTP APIs"
        read -p "Choose an option: " api_option

        if [ "$api_option" == "1" ]; then
            aws apigateway get-rest-apis --output $OUTPUT_FORMAT
        elif [ "$api_option" == "2" ]; then
            aws apigatewayv2 get-apis --output $OUTPUT_FORMAT
        else
            echo "Invalid option for API type."
        fi
    fi
}

# Main menu
while true; do
    echo "======================="
    echo " AWS CLI Utility Menu"
    echo "======================="
    echo "1 - List Lambda Functions"
    echo "2 - List API Gateway APIs"
    echo "3 - Exit"
    read -p "Choose an option: " option

    case $option in
        1) list_lambdas ;;
        2) list_apis ;;
        3) echo "Exiting..."; exit ;;
        *) echo "Invalid option, please choose 1, 2, or 3." ;;
    esac
done


