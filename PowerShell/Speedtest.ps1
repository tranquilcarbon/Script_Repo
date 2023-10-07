# Define the path to the speedtest-cli executable
$SpeedtestCliPath = "C:\Utilities\Speedtest\speedtest.exe"  # Replace with the actual path

# Define a list of server IDs
$ServerIDs = @(9058, 9714, 5189)  # Add more server IDs as needed

# Select a random server ID from the list
$RandomServerID = Get-Random -InputObject $ServerIDs

# Define the Speedtest CLI command
$SpeedtestCommand = "$SpeedtestCliPath -s $RandomServerID --f=json"

# Because no status is shown, write this text so it doesn't look like it's failed.
Write-Host "Please wait while the test is performed. This might take a minute."

# Run the Speedtest CLI and capture the JSON output
$SpeedtestResult = Invoke-Expression -Command $SpeedtestCommand

# Check if the Speedtest was successful
if ($SpeedtestResult -ne $null) {
    # Parse the JSON result
    $SpeedtestData = $SpeedtestResult | ConvertFrom-Json

    # Extract the relevant information
    $Ping = $SpeedtestData.ping.latency
    $DownloadSpeed = [math]::Round(($SpeedtestData.download.bandwidth / 1MB), 2)
    $UploadSpeed = [math]::Round(($SpeedtestData.upload.bandwidth / 1MB), 2)
	$ServerProvider = $SpeedtestData.server.name

    # Define the path for the output text file
    $OutputFilePath = "C:\Logs\Speedtest\Results.txt"  # Change this to your desired file path

    # Create a string with the results
    $ResultsText = @"
Server Provider: $ServerProvider
Ping (ms): $Ping
Download Speed (Mbps): $DownloadSpeed
Upload Speed (Mbps): $UploadSpeed
"@

    # Save the results to the text file
    $ResultsText | Out-File -FilePath $OutputFilePath -Encoding utf8

    Write-Host "Results saved to $OutputFilePath"
}
else {
    Write-Host "Speedtest failed. Please check your internet connection or the Speedtest CLI installation."
}
