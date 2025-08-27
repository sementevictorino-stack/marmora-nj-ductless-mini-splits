# PowerShell script to update all service HTML files with Marmora, NJ content

# Get all service files
$serviceFiles = Get-ChildItem "services\*.html" | Select-Object -ExpandProperty Name

# Function to update service files
function Update-ServiceFile {
    param([string]$FilePath)
    
    Write-Host "Updating $FilePath..."
    
    $content = Get-Content $FilePath -Raw
    
    # Update all Indiana references to New Jersey
    $content = $content -replace "\bIN\b", "NJ"
    $content = $content -replace "\bIndiana\b", "New Jersey"
    $content = $content -replace "Huntertown", "Marmora"
    $content = $content -replace "Fort Wayne", "Ocean City"
    $content = $content -replace "Allen County", "Cape May County"
    $content = $content -replace "northeastern Indiana", "South Jersey"
    $content = $content -replace "46748", "08223"
    $content = $content -replace "46845", "08053"
    $content = $content -replace "12845 Coldwater Road", "102 S Main Street"
    
    # Update climate references
    $content = $content -replace "continental climate", "temperate coastal climate"
    $content = $content -replace "frigid winter months", "cooler winter months"
    $content = $content -replace "Indiana's varied climate", "New Jersey's varied climate"
    $content = $content -replace "Indiana's coldest months", "New Jersey's coldest months"
    
    # Update coordinates for Marmora, NJ
    $content = $content -replace "41\.1306", "39.2934"
    $content = $content -replace "-85\.1394", "-74.6482"
    
    Write-Content -Path $FilePath -Value $content -NoNewline
    Write-Host "Updated $FilePath successfully."
}

# Update all service files
foreach ($file in $serviceFiles) {
    $filePath = "services\$file"
    if (Test-Path $filePath) {
        Update-ServiceFile -FilePath $filePath
    }
}

Write-Host "All service files updated successfully!"
