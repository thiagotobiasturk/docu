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
        $lambdas = aws lambda list-functions --output $outputFormat --region $region --no-paginate | ConvertFrom-Json
    } else {
        $lambdas = aws lambda list-functions --output $outputFormat --no-paginate | ConvertFrom-Json
    }

    # If the output format is JSON, save to CSV
    if ($outputFormat -eq "json") {
        $lambdas.Functions | Select-Object FunctionName, Runtime, LastModified | Export-Csv -Path "lambdas_list.csv" -NoTypeInformation
        Write-Host "Lambda functions saved to lambdas_list.csv"
    } else {
        # If the output is a table, just display it
        $lambdas.Functions | Format-Table FunctionName, Runtime, LastModified
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
