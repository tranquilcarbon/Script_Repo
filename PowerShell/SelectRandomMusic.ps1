# Define the number of songs you want and the folder where the music is located
$numberOfSongs = Read-Host "Enter the number of songs you want to select"
$musicFolder = Read-Host "Enter the folder path where the music is located"

# Define the output text file path
$outputFilePath = "E:\Projects\selected_songs.txt"

# Get a list of all music files in the specified folder
$musicFiles = Get-ChildItem -Path $musicFolder -File -Recurse | Where-Object { $_.Extension -match '\.(mp3|wav|flac)$' }

# Check if there are enough music files
if ($musicFiles.Count -lt $numberOfSongs) {
    Write-Host "Not enough music files in the folder."
} else {
    # Select a random sample of music files
    $selectedMusic = Get-Random -InputObject $musicFiles -Count $numberOfSongs

    # Write the selected file paths to the output text file
    $selectedMusic | ForEach-Object { $_.FullName } | Out-File -FilePath $outputFilePath

    Write-Host "Selected songs have been written to $outputFilePath"
	
	   # Prompt to ask if the user wants to copy the selected files
    $copyToProjectFolder = Read-Host "Would you like to copy the selected files to a project folder? (Y/N)"
    if ($copyToProjectFolder -eq "Y" -or $copyToProjectFolder -eq "y") {
        $projectFolder = Read-Host "Enter the folder path where you want to copy the files"
        foreach ($file in $selectedMusic) {
            $destinationPath = Join-Path -Path $projectFolder -ChildPath $file.Name
            Copy-Item -Path $file.FullName -Destination $destinationPath
        }
        Write-Host "Selected files have been copied to $projectFolder"
    }
}
