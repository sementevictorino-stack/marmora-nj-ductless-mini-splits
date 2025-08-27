# Fix navigation menus in all HTML files

$oldNavigation = @"
                            <a href="../locations/fort-wayne-ductless-mini-splits.html">Fort Wayne</a>
                            <a href="../locations/new-haven-ductless-mini-splits.html">New Haven</a>
                            <a href="../locations/woodburn-ductless-mini-splits.html">Woodburn</a>
                            <a href="../locations/grabill-ductless-mini-splits.html">Grabill</a>
                            <a href="../locations/auburn-ductless-mini-splits.html">Auburn</a>
                            <a href="../locations/garrett-ductless-mini-splits.html">Garrett</a>
"@

$newNavigation = @"
                            <a href="../locations/fort-wayne-ductless-mini-splits.html">Ocean City</a>
                            <a href="../locations/new-haven-ductless-mini-splits.html">Wildwood Crest</a>
                            <a href="../locations/woodburn-ductless-mini-splits.html">Sea Isle City</a>
                            <a href="../locations/grabill-ductless-mini-splits.html">Galloway</a>
                            <a href="../locations/auburn-ductless-mini-splits.html">Ventnor City</a>
                            <a href="../locations/garrett-ductless-mini-splits.html">Egg Harbor Township</a>
"@

# Alternative pattern for locations (without ../)
$oldNavLocationPattern = @"
                            <a href="fort-wayne-ductless-mini-splits.html">Fort Wayne</a>
                            <a href="new-haven-ductless-mini-splits.html">New Haven</a>
                            <a href="woodburn-ductless-mini-splits.html">Woodburn</a>
                            <a href="grabill-ductless-mini-splits.html">Grabill</a>
                            <a href="auburn-ductless-mini-splits.html">Auburn</a>
                            <a href="garrett-ductless-mini-splits.html">Garrett</a>
"@

$newNavLocationPattern = @"
                            <a href="fort-wayne-ductless-mini-splits.html">Ocean City</a>
                            <a href="new-haven-ductless-mini-splits.html">Wildwood Crest</a>
                            <a href="woodburn-ductless-mini-splits.html">Sea Isle City</a>
                            <a href="grabill-ductless-mini-splits.html">Galloway</a>
                            <a href="auburn-ductless-mini-splits.html">Ventnor City</a>
                            <a href="garrett-ductless-mini-splits.html">Egg Harbor Township</a>
"@

Write-Host "Updating navigation menus in all files..."

# Update service files
Get-ChildItem "services\*.html" | ForEach-Object {
    Write-Host "Updating navigation in $($_.Name)..."
    $content = Get-Content $_.FullName -Raw
    $content = $content -replace [regex]::Escape($oldNavigation), $newNavigation
    
    # Also fix individual city names in the navigation
    $content = $content -replace '>Fort Wayne</a>', '>Ocean City</a>'
    $content = $content -replace '>New Haven</a>', '>Wildwood Crest</a>'
    $content = $content -replace '>Woodburn</a>', '>Sea Isle City</a>'
    $content = $content -replace '>Grabill</a>', '>Galloway</a>'
    $content = $content -replace '>Auburn</a>', '>Ventnor City</a>'
    $content = $content -replace '>Garrett</a>', '>Egg Harbor Township</a>'
    $content = $content -replace '>Butler</a>', '>Linwood</a>'
    $content = $content -replace '>Waterloo</a>', '>Stone Harbor</a>'
    $content = $content -replace '>Angola</a>', '>Brigantine</a>'
    $content = $content -replace '>Fremont</a>', '>Somers Point</a>'
    $content = $content -replace '>Kendallville</a>', '>Cape May Court House</a>'
    $content = $content -replace '>Ligonier</a>', '>Cape May</a>'
    $content = $content -replace '>Albion</a>', '>Ocean City</a>'
    $content = $content -replace '>Rome City</a>', '>Avalon</a>'
    $content = $content -replace '>Avilla</a>', '>Margate City</a>'
    $content = $content -replace '>Churubusco</a>', '>Northfield</a>'
    $content = $content -replace '>Columbia City</a>', '>Pleasantville</a>'
    $content = $content -replace '>Huntertown</a>', '>Marmora</a>'
    $content = $content -replace '>Roanoke</a>', '>North Wildwood</a>'
    $content = $content -replace '>Monroeville</a>', '>Wildwood</a>'
    
    Set-Content $_.FullName $content -NoNewline
}

# Update location files
Get-ChildItem "locations\*.html" | ForEach-Object {
    Write-Host "Updating navigation in $($_.Name)..."
    $content = Get-Content $_.FullName -Raw
    $content = $content -replace [regex]::Escape($oldNavLocationPattern), $newNavLocationPattern
    
    # Also fix individual city names in the navigation
    $content = $content -replace '>Fort Wayne</a>', '>Ocean City</a>'
    $content = $content -replace '>New Haven</a>', '>Wildwood Crest</a>'
    $content = $content -replace '>Woodburn</a>', '>Sea Isle City</a>'
    $content = $content -replace '>Grabill</a>', '>Galloway</a>'
    $content = $content -replace '>Auburn</a>', '>Ventnor City</a>'
    $content = $content -replace '>Garrett</a>', '>Egg Harbor Township</a>'
    $content = $content -replace '>Butler</a>', '>Linwood</a>'
    $content = $content -replace '>Waterloo</a>', '>Stone Harbor</a>'
    $content = $content -replace '>Angola</a>', '>Brigantine</a>'
    $content = $content -replace '>Fremont</a>', '>Somers Point</a>'
    $content = $content -replace '>Kendallville</a>', '>Cape May Court House</a>'
    $content = $content -replace '>Ligonier</a>', '>Cape May</a>'
    $content = $content -replace '>Albion</a>', '>Ocean City</a>'
    $content = $content -replace '>Rome City</a>', '>Avalon</a>'
    $content = $content -replace '>Avilla</a>', '>Margate City</a>'
    $content = $content -replace '>Churubusco</a>', '>Northfield</a>'
    $content = $content -replace '>Columbia City</a>', '>Pleasantville</a>'
    $content = $content -replace '>Huntertown</a>', '>Marmora</a>'
    $content = $content -replace '>Roanoke</a>', '>North Wildwood</a>'
    $content = $content -replace '>Monroeville</a>', '>Wildwood</a>'
    
    Set-Content $_.FullName $content -NoNewline
}

Write-Host "All navigation menus updated successfully!"
