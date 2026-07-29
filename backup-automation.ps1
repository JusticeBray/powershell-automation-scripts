
# Backup Script - Copies files from a source folder to a backup folder

$source = "C:\Users\Justice\Desktop\Source Folder"
$destination = "C:\Users\Justice\Desktop\BackupFolder"

if (!(Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination
    Write-Host "Created backup folder at $destination"
}

$files = Get-ChildItem -Path $source

foreach ($file in $files) {
    Copy-Item -Path $file.FullName -Destination $destination -Force
    Write-Host "Backed up:" $file.Name
}

Write-Host "Backup completed successfully!"
