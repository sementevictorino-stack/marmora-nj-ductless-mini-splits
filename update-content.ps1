# PowerShell script to update all HTML files with Marmora, NJ content

# Define mappings for location files
$locationMappings = @{
    "angola-ductless-mini-splits.html" = @{
        "city" = "Brigantine"
        "zipcode" = "08203"
        "address" = "208 Atlantic Avenue"
        "lat" = "39.4101"
        "lon" = "-74.3648"
    }
    "auburn-ductless-mini-splits.html" = @{
        "city" = "Ventnor City"
        "zipcode" = "08406"
        "address" = "6201 Ventnor Avenue"
        "lat" = "39.3373"
        "lon" = "-74.4854"
    }
    "avilla-ductless-mini-splits.html" = @{
        "city" = "Margate City"
        "zipcode" = "08402"
        "address" = "8300 Ventnor Avenue"
        "lat" = "39.3248"
        "lon" = "-74.5015"
    }
    "butler-ductless-mini-splits.html" = @{
        "city" = "Linwood"
        "zipcode" = "08221"
        "address" = "400 New Road"
        "lat" = "39.3398"
        "lon" = "-74.5754"
    }
    "churubusco-ductless-mini-splits.html" = @{
        "city" = "Northfield"
        "zipcode" = "08225"
        "address" = "1600 New Road"
        "lat" = "39.3626"
        "lon" = "-74.5579"
    }
    "columbia-city-ductless-mini-splits.html" = @{
        "city" = "Pleasantville"
        "zipcode" = "08232"
        "address" = "15 S Main Street"
        "lat" = "39.3890"
        "lon" = "-74.5243"
    }
    "fort-wayne-ductless-mini-splits.html" = @{
        "city" = "Ocean City"
        "zipcode" = "08226"
        "address" = "861 Asbury Avenue"
        "lat" = "39.2776"
        "lon" = "-74.5746"
    }
    "fremont-ductless-mini-splits.html" = @{
        "city" = "Somers Point"
        "zipcode" = "08244"
        "address" = "1 W New York Avenue"
        "lat" = "39.3176"
        "lon" = "-74.5993"
    }
    "garrett-ductless-mini-splits.html" = @{
        "city" = "Egg Harbor Township"
        "zipcode" = "08234"
        "address" = "3515 Fire Road"
        "lat" = "39.3665"
        "lon" = "-74.6432"
    }
    "grabill-ductless-mini-splits.html" = @{
        "city" = "Galloway"
        "zipcode" = "08205"
        "address" = "300 E Jimmie Leeds Road"
        "lat" = "39.4787"
        "lon" = "-74.4754"
    }
    "huntertown-ductless-mini-splits.html" = @{
        "city" = "Marmora"
        "zipcode" = "08223"
        "address" = "102 S Main Street"
        "lat" = "39.2934"
        "lon" = "-74.6482"
    }
    "kendallville-ductless-mini-splits.html" = @{
        "city" = "Cape May Court House"
        "zipcode" = "08210"
        "address" = "4 Moore Road"
        "lat" = "39.0851"
        "lon" = "-74.8260"
    }
    "ligonier-ductless-mini-splits.html" = @{
        "city" = "Cape May"
        "zipcode" = "08204"
        "address" = "643 Washington Street"
        "lat" = "38.9351"
        "lon" = "-74.9060"
    }
    "monroeville-ductless-mini-splits.html" = @{
        "city" = "Wildwood"
        "zipcode" = "08260"
        "address" = "4400 New Jersey Avenue"
        "lat" = "38.9912"
        "lon" = "-74.8146"
    }
    "new-haven-ductless-mini-splits.html" = @{
        "city" = "Wildwood Crest"
        "zipcode" = "08260"
        "address" = "6101 Pacific Avenue"
        "lat" = "38.9731"
        "lon" = "-74.8368"
    }
    "roanoke-ductless-mini-splits.html" = @{
        "city" = "North Wildwood"
        "zipcode" = "08260"
        "address" = "901 New York Avenue"
        "lat" = "39.0015"
        "lon" = "-74.8004"
    }
    "rome-city-ductless-mini-splits.html" = @{
        "city" = "Avalon"
        "zipcode" = "08202"
        "address" = "3100 Dune Drive"
        "lat" = "39.1043"
        "lon" = "-74.7293"
    }
    "waterloo-ductless-mini-splits.html" = @{
        "city" = "Stone Harbor"
        "zipcode" = "08247"
        "address" = "9508 Second Avenue"
        "lat" = "39.0498"
        "lon" = "-74.7593"
    }
    "woodburn-ductless-mini-splits.html" = @{
        "city" = "Sea Isle City"
        "zipcode" = "08243"
        "address" = "4501 Landis Avenue"
        "lat" = "39.1537"
        "lon" = "-74.6926"
    }
}

# Function to update a file with new content
function Update-HTMLFile {
    param(
        [string]$FilePath,
        [string]$CityName,
        [string]$ZipCode,
        [string]$Address,
        [string]$Latitude,
        [string]$Longitude
    )
    
    Write-Host "Updating $FilePath for $CityName, NJ..."
    
    $content = Get-Content $FilePath -Raw
    
    # Update basic location references - all Indiana cities to New Jersey cities
    $content = $content -replace "IN\b", "NJ"
    $content = $content -replace "Indiana\b", "New Jersey"
    $content = $content -replace "northeastern Indiana", "South Jersey"
    $content = $content -replace "Allen County", "Cape May County"
    $content = $content -replace "Fort Wayne metropolitan area", "South Jersey area"
    
    # Update climate references
    $content = $content -replace "continental climate", "temperate coastal climate"
    $content = $content -replace "frigid winter months", "cooler winter months"
    $content = $content -replace "Indiana's varied climate", "New Jersey's varied climate"
    $content = $content -replace "Indiana's coldest months", "New Jersey's coldest months"
    
    Write-Content -Path $FilePath -Value $content -NoNewline
    Write-Host "Updated $FilePath successfully."
}

# Update all location files
foreach ($file in $locationMappings.Keys) {
    $filePath = "locations\$file"
    if (Test-Path $filePath) {
        $mapping = $locationMappings[$file]
        Update-HTMLFile -FilePath $filePath -CityName $mapping.city -ZipCode $mapping.zipcode -Address $mapping.address -Latitude $mapping.lat -Longitude $mapping.lon
    }
}

Write-Host "All location files updated successfully!"
