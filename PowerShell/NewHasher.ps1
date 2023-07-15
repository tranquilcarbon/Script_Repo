$folderPath = Read-Host "Enter folder path"
# gets folder path.
$files = Get-ChildItem -Path $folderPath -Recurse -File
$totalFiles = $files.Count
$currentFile = 1

Write-Host "Generating hashes for $totalFiles files in $folderPath" -ForegroundColor Yellow

foreach ($file in $files) {
    $filePath = $file.FullName
    $fileName = $file.Name
    $md5Hash = Get-FileHash -Path $filePath -Algorithm MD5
    $sha1Hash = Get-FileHash -Path $filePath -Algorithm SHA1
    $sha256Hash = Get-FileHash -Path $filePath -Algorithm SHA256
    #part that get hashes.

    Write-Host "Hashing file $currentFile of $totalFiles - $fileName" -NoNewline

    Write-Output "File: $filePath"
    Write-Output "MD5 hash: $($md5Hash.Hash)"
    Write-Output "SHA1 hash: $($sha1Hash.Hash)"
    Write-Output "SHA256 hash: $($sha256Hash.Hash)"
    Write-Output ""

    $currentFile++
}

Write-Host "Hashing complete" -ForegroundColor Green
