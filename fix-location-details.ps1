# Comprehensive fix for all location files - addresses and coordinates

$locationData = @{
    "albania-ductless-mini-splits.html" = @{ address = "861 Asbury Avenue"; lat = "39.2776"; lon = "-74.5746" }
    "angola-ductless-mini-splits.html" = @{ address = "208 Atlantic Avenue"; lat = "39.4101"; lon = "-74.3648" }
    "auburn-ductless-mini-splits.html" = @{ address = "6201 Ventnor Avenue"; lat = "39.3373"; lon = "-74.4854" }
    "avilla-ductless-mini-splits.html" = @{ address = "8300 Ventnor Avenue"; lat = "39.3248"; lon = "-74.5015" }
    "butler-ductless-mini-splits.html" = @{ address = "400 New Road"; lat = "39.3398"; lon = "-74.5754" }
    "churubusco-ductless-mini-splits.html" = @{ address = "1600 New Road"; lat = "39.3626"; lon = "-74.5579" }
    "columbia-city-ductless-mini-splits.html" = @{ address = "15 S Main Street"; lat = "39.3890"; lon = "-74.5243" }
    "fort-wayne-ductless-mini-splits.html" = @{ address = "861 Asbury Avenue"; lat = "39.2776"; lon = "-74.5746" }
    "fremont-ductless-mini-splits.html" = @{ address = "1 W New York Avenue"; lat = "39.3176"; lon = "-74.5993" }
    "garrett-ductless-mini-splits.html" = @{ address = "3515 Fire Road"; lat = "39.3665"; lon = "-74.6432" }
    "grabill-ductless-mini-splits.html" = @{ address = "300 E Jimmie Leeds Road"; lat = "39.4787"; lon = "-74.4754" }
    "huntertown-ductless-mini-splits.html" = @{ address = "102 S Main Street"; lat = "39.2934"; lon = "-74.6482" }
    "kendallville-ductless-mini-splits.html" = @{ address = "4 Moore Road"; lat = "39.0851"; lon = "-74.8260" }
    "ligonier-ductless-mini-splits.html" = @{ address = "643 Washington Street"; lat = "38.9351"; lon = "-74.9060" }
    "monroeville-ductless-mini-splits.html" = @{ address = "4400 New Jersey Avenue"; lat = "38.9912"; lon = "-74.8146" }
    "new-haven-ductless-mini-splits.html" = @{ address = "6101 Pacific Avenue"; lat = "38.9731"; lon = "-74.8368" }
    "roanoke-ductless-mini-splits.html" = @{ address = "901 New York Avenue"; lat = "39.0015"; lon = "-74.8004" }
    "rome-city-ductless-mini-splits.html" = @{ address = "3100 Dune Drive"; lat = "39.1043"; lon = "-74.7293" }
    "waterloo-ductless-mini-splits.html" = @{ address = "9508 Second Avenue"; lat = "39.0498"; lon = "-74.7593" }
    "woodburn-ductless-mini-splits.html" = @{ address = "4501 Landis Avenue"; lat = "39.1537"; lon = "-74.6926" }
}

foreach ($file in $locationData.Keys) {
    if (Test-Path "locations\$file") {
        Write-Host "Updating $file..."
        $content = Get-Content "locations\$file" -Raw
        $data = $locationData[$file]
        
        # Update coordinates in JSON-LD (look for common patterns)
        $content = $content -replace '"latitude": 41\.\d+', "`"latitude`": $($data.lat)"
        $content = $content -replace '"latitude": 40\.\d+', "`"latitude`": $($data.lat)"
        $content = $content -replace '"longitude": -85\.\d+', "`"longitude`": $($data.lon)"
        $content = $content -replace '"longitude": -84\.\d+', "`"longitude`": $($data.lon)"
        
        # Update street addresses
        $content = $content -replace '"streetAddress": "[^"]*"', "`"streetAddress`": `"$($data.address)`""
        
        Set-Content "locations\$file" $content -NoNewline
        Write-Host "Updated $file successfully."
    }
}

Write-Host "All location files updated with correct addresses and coordinates!"
