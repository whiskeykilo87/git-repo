﻿# Define variables
$oktaBaseUrl = "https://dev-66709277.okta.com/"
$apiKey = "004WHlGJJe38s3TxV7hD7UBnwp1xk7Dy3M82u1XZWs"
$firstName = "John"
$lastName = "Connor"
$email = "johnconner@gmail.com
dev-66709277.okta.com"
$password = "G3tD0wn!!"

# Define the API endpoint
$uri = "$oktaBaseUrl/users?activate=true"

# Define the user object to be created
$userObject = @{
    "profile" = @{
        "firstName" = $firstName
        "lastName" = $lastName
        "email" = $email
        "login" = $email
    }
    "credentials" = @{
        "password" = @{
            "value" = $password
        }
    }
}

# Convert the user object to JSON
$jsonBody = $userObject | ConvertTo-Json

# Create the API request
$headers = @{
    "Authorization" = "SSWS $apiKey"
    "Content-Type" = "application/json"
}
$response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $jsonBody

# Output the response
Write-Output $response
