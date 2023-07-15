$folderPath = Read-Host "Enter folder path"

Get-ChildItem -Path $folderPath -Recurse -File | ForEach-Object {
    $filePath = $_.FullName
	Write-Output "Now Hashing file $filePath ..."
    $md5Hash = Get-FileHash -Path $filePath -Algorithm MD5
    $sha1Hash = Get-FileHash -Path $filePath -Algorithm SHA1
    $sha256Hash = Get-FileHash -Path $filePath -Algorithm SHA256

	Write-Output "Complete."
    Write-Output "MD5 hash: $($md5Hash.Hash)"
    Write-Output "SHA1 hash: $($sha1Hash.Hash)"
    Write-Output "SHA256 hash: $($sha256Hash.Hash)"
	Write-Output "==================================================================="
}
