# Set the Okta API endpoint and API token
$oktaBaseUrl = "https://dev-66709277.okta.com/"
$oktaApiToken = "005MrhO7jdM62IQQnQ2ys8FSyeMqoi68-aTfQ6Wkob"

# Set the user ID of the user to be deactivated
$userID = "johnconner@gmail.com
dev-66709277.okta.com"

# Set the API endpoint for updating the user's status
$endpoint = "$oktaBaseUrl/api/v1/users/$userID"

# Set the headers for the API request
$headers = @{
    "Accept" = "application/json"
    "Content-Type" = "application/json"
    "Authorization" = "SSWS $oktaApiToken"
}

# Set the body of the API request to update the user's status
$body = @{
    "status" = "DEPROVISIONED"
} | ConvertTo-Json

# Send the PATCH request to update the user's status
$response = Invoke-RestMethod -Method Patch -Uri $endpoint -Headers $headers -Body $body

# Check if the API request was successful
if ($response.statusCode -eq 200) {
    Write-Host "User account deactivated."
} else {
    Write-Host "Failed to deactivate user account. Error message: $($response.errorSummary)"
}
