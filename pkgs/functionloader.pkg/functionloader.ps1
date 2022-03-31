function global:HelpPrompt ($propmt){
    if ($prompt-eq "") {
        global:userPrompt
    }elseif (Test-Path -Path ".\help\$prompt.help") {
        $exepath = ".\help\$prompt.help\$prompt.ps1"
        .$exepath
    }else {
        mkdir -Path ".\temp\$prompt.help" | Out-Null
        Invoke-WebRequest -Uri "http://alexaelectronics.atwebpages.com/download/AHelper/help/$prompt.help/$prompt.ps1" -OutFile ".\temp\$prompt.help\$prompt.ps1"
        if($?){
            # No error
            $exepath = ".\temp\$prompt.help\$prompt.ps1"
            .$exepath
            global:userPrompt
        }else {
            # Error in URI
            # Search database by relavent keyword
            Write-Host "No relavent keyword for help." -ForegroundColor Red
            global:userPrompt
        }
    }
} 