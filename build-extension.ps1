# PowerShell script to rebuild the Azure DevOps extension

Write-Host "Building Azure DevOps Extension..." -ForegroundColor Green

# Set error action preference
$ErrorActionPreference = "Stop"

try {
    # Check if tfx-cli is installed
    Write-Host "Checking for tfx-cli..." -ForegroundColor Yellow
    
    # Try to get tfx version
    $tfxInstalled = $false
    try {
        # Use Get-Command to check if tfx exists
        $tfxCmd = Get-Command tfx -ErrorAction SilentlyContinue
        if ($tfxCmd) {
            $tfxVersion = & tfx version 2>$null
            if ($tfxVersion -and $LASTEXITCODE -eq 0) {
                $tfxInstalled = $true
                Write-Host "Using tfx-cli: $tfxVersion" -ForegroundColor Green
            }
        }
    } catch {
        # Command not found or failed
    }
    
    if (-not $tfxInstalled) {
        Write-Host "tfx-cli is not installed or not working. Installing globally..." -ForegroundColor Yellow
        npm install -g tfx-cli
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to install tfx-cli. Please install Node.js and npm first."
        }
        
        # Verify installation
        $tfxVersion = & tfx version 2>$null
        if ($tfxVersion -and $LASTEXITCODE -eq 0) {
            Write-Host "tfx-cli installed successfully: $tfxVersion" -ForegroundColor Green
        } else {
            throw "tfx-cli installation failed or not accessible"
        }
    }

    # Clean up old .vsix files
    Write-Host "Cleaning up old extension files..." -ForegroundColor Yellow
    Get-ChildItem -Path "." -Filter "*.vsix" | Remove-Item -Force -ErrorAction SilentlyContinue

    # Validate manifest file exists
    if (!(Test-Path "vss-extension.json")) {
        throw "Extension manifest (vss-extension.json) not found!"
    }

    # Build the extension
    Write-Host "Building extension..." -ForegroundColor Green
    tfx extension create --manifest-globs vss-extension.json

    if ($LASTEXITCODE -eq 0) {
        $newVsix = Get-ChildItem -Path "." -Filter "*.vsix" | Select-Object -First 1
        if ($newVsix) {
            Write-Host "Extension built successfully: $($newVsix.Name)" -ForegroundColor Green
            Write-Host "File size: $([math]::Round($newVsix.Length / 1MB, 2)) MB" -ForegroundColor Cyan
            Write-Host "You can now upload this to the Visual Studio Marketplace or install it directly in Azure DevOps." -ForegroundColor Cyan
        } else {
            throw "Extension built but .vsix file not found!"
        }
    } else {
        throw "Extension build failed with exit code $LASTEXITCODE"
    }

} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
