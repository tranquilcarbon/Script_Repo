param (
    [string]$folderPath,
    [int]$numFilesPerFolder
)

# If the folderPath or numFilesPerFolder is not provided as arguments, prompt the user for input
if (-not $folderPath) {
    $folderPath = Read-Host "Enter the folder path:"
}

if (-not $numFilesPerFolder) {
    $numFilesPerFolder = Read-Host "Enter the number of files per folder:"
}

# Rest of the script remains the same
$currentFolderLetter = $null
$currentFolderNumber = $null
$currentFolderCount = 0

$sortedFiles = Get-ChildItem -File $folderPath | Sort-Object

try {
    $folderIndex = 1
    for ($i = 0; $i -lt $sortedFiles.Count; $i++) {
        $file = $sortedFiles[$i]
        if ($currentFolderCount -eq 0) {
            $currentFolderLetter = $file.Name[1]  # Use the second letter of the file name
            $currentFolderNumber = $folderIndex
            $folderIndex++
        }

        $currentFolderName = "${currentFolderLetter}_$currentFolderNumber"
        $currentFolderPath = Join-Path $folderPath $currentFolderName
        New-Item -ItemType Directory -Path $currentFolderPath -Force

        for ($j = 0; $j -lt $numFilesPerFolder -and ($i + $j) -lt $sortedFiles.Count; $j++) {
            $sourceFile = $sortedFiles[$i + $j]
            Move-Item $sourceFile.FullName -Destination $currentFolderPath
        }

        $i += $j - 1
        $currentFolderCount = 0
        if ($j -lt $numFilesPerFolder) {
            $currentFolderNumber = $folderIndex
            $folderIndex++
        }
    }
} catch {
    Write-Host "Error: $_"
}
