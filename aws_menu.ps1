# Function to list Lambda functions
function List-Lambdas {
    Write-Host "How would you like to display the Lambdas?"
    Write-Host "1 - JSON"
    Write-Host "2 - Table"
    $formatOption = Read-Host "Choose an option"

    # Set the output format based on user input
    switch ($formatOption) {
        1 { $outputFormat = "json" }
        2 { $outputFormat = "table" }
        default { Write-Host "Invalid option. Defaulting to JSON."; $outputFormat = "json" }
    }

    # Ask if they want to specify a region
    $regionOption = Read-Host "Do you want to filter by a region? (y/n)"
    if ($regionOption -eq "y") {
        $region = Read-Host "Enter the AWS region (e.g., us-east-1)"
        aws lambda list-functions --output $outputFormat --region $region
    } else {
        aws lambda list-functions --output $outputFormat
    }
}

# Function to list APIs from API Gateway
function List-APIs {
    Write-Host "How would you like to display the APIs?"
    Write-Host "1 - JSON"
    Write-Host "2 - Table"
    $formatOption = Read-Host "Choose an option"

    # Set the output format based on user input
    switch ($formatOption) {
        1 { $outputFormat = "json" }
        2 { $outputFormat = "table" }
        default { Write-Host "Invalid option. Defaulting to JSON."; $outputFormat = "json" }
    }

    # Ask if they want to specify a region
    $regionOption = Read-Host "Do you want to filter by a region? (y/n)"
    if ($regionOption -eq "y") {
        $region = Read-Host "Enter the AWS region (e.g., us-east-1)"
        Write-Host "1 - List REST APIs"
        Write-Host "2 - List HTTP APIs"
        $apiOption = Read-Host "Choose an option"

        if ($apiOption -eq "1") {
            aws apigateway get-rest-apis --output $outputFormat --region $region
        } elseif ($apiOption -eq "2") {
            aws apigatewayv2 get-apis --output $outputFormat --region $region
        } else {
            Write-Host "Invalid option for API type."
        }
    } else {
        Write-Host "1 - List REST APIs"
        Write-Host "2 - List HTTP APIs"
        $apiOption = Read-Host "Choose an option"

        if ($apiOption -eq "1") {
            aws apigateway get-rest-apis --output $outputFormat
        } elseif ($apiOption -eq "2") {
            aws apigatewayv2 get-apis --output $outputFormat
        } else {
            Write-Host "Invalid option for API type."
        }
    }
}

# Main menu
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
