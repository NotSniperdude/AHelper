function global:HelpPrompt ($propmt){
    if ($prompt-eq "") {
        global:prompt
    }elseif (Test-Path -Path ".\help\$prompt.help") {
        $exepath = ".\help\$prompt.help\$prompt.ps1"
        .$exepath
    }else {
        mkdir -Path ".\temp\$prompt.help" | Out-Null
        Invoke-WebRequest -Uri "http://alexaelectronics.atwebpages.com/download/pkgmgr/$prompt/$prompt.ps1" -OutFile ".\temp\$prompt.help\$prompt.ps1"
        if($?){
            # No error
            .\temp\$prompt.help\$prompt.ps1
        }else {
            # Error in URI
            # Search database by relavent keyword
            Write-Host "No Relavent Keyword for help." -ForegroundColor Red
            global:userPrompt
        }
    }
} 