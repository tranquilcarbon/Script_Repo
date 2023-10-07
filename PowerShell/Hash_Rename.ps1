# Step 1: Provide the folder path
$folderPath = Read-Host "Enter the folder path"

# Check if the folder path exists
if (Test-Path -Path $folderPath -PathType Container) {
    # Step 2: Generate SHA256 hash for each file and rename
    Get-ChildItem -Path $folderPath | ForEach-Object {
        $file = $_
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256
        $newName = $hash.Hash + $file.Extension
        Rename-Item -Path $file.FullName -NewName $newName
        Write-Host "Renamed $($file.Name) to $newName"
    }
    Write-Host "Renaming completed."
} else {
    Write-Host "The provided folder path does not exist."
}
