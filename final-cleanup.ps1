# Final cleanup script for all HTML files

Write-Host "Running final cleanup on all HTML files..."

# Update all HTML files (including index.html)
Get-ChildItem "*.html" | ForEach-Object {
    Write-Host "Processing $($_.Name)..."
    $content = Get-Content $_.FullName -Raw
    
    # Fix remaining zip codes
    $content = $content -replace "46703", "08203"
    $content = $content -replace "46748", "08223"
    $content = $content -replace "46845", "08053"
    $content = $content -replace "46805", "08226"
    
    Set-Content $_.FullName $content -NoNewline
}

# Update location files specifically
Get-ChildItem "locations\*.html" | ForEach-Object {
    Write-Host "Processing location file $($_.Name)..."
    $content = Get-Content $_.FullName -Raw
    
    # Fix remaining zip codes and state references
    $content = $content -replace "46703", "08203"
    $content = $content -replace "46748", "08223"
    $content = $content -replace "46845", "08053"
    $content = $content -replace "46805", "08226"
    $content = $content -replace "46706", "08234"
    $content = $content -replace "46761", "08244"
    $content = $content -replace "46738", "08221"
    
    Set-Content $_.FullName $content -NoNewline
}

# Update service files specifically
Get-ChildItem "services\*.html" | ForEach-Object {
    Write-Host "Processing service file $($_.Name)..."
    $content = Get-Content $_.FullName -Raw
    
    # Fix remaining zip codes
    $content = $content -replace "46748", "08223"
    $content = $content -replace "46845", "08053"
    
    Set-Content $_.FullName $content -NoNewline
}

Write-Host "Final cleanup completed successfully!"
