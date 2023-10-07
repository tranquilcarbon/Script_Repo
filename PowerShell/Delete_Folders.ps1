$folderPath = Read-Host -Prompt "Enter the path to the folder you want to delete the contents of"
Write-Warning "WARNING: This will delete ALL files and folders within the specified folder path"
Write-Warning "Before running this script, make sure you have verified that this is the right path."
Write-Output "Top-level folders:"
Get-ChildItem -Path $folderPath -Directory | ForEach-Object {
    Write-Output $_.Name
}
$confirmation = Read-Host -Prompt "Are you sure you want to proceed? (y/n)"
if ($confirmation -eq "y") {
    Get-ChildItem -Path $folderPath -Recurse | ForEach-Object {
        Write-Output "Deleting $($_.FullName)"
        Remove-Item $_.FullName -Force
    }
}
