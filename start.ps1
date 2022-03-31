function global:userPrompt {
    $prompt = Read-Host "What do you need help with?"
    global:HelpPrompt $prompt
}
Clear-Host
Write-Host "(C)2022 ΛHelper"
#Setup Variables
$ErrorActionPreference = "SilentlyContinue"
# Location Bug Fix
Set-Location $PSScriptRoot
 # Load Packages
.\pkgs\functionloader.pkg\functionloader.ps1
# Create temp folder if not already
if (Test-Path -Path ".\temp") {
    global:userPrompt
}else {
    mkdir -Path ".\temp" | Out-Null
    global:userPrompt
}