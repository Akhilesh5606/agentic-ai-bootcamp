if (-not $env:GEMINI_API_KEY) {
    if (Test-Path "$PSScriptRoot\.env") {
        Get-Content "$PSScriptRoot\.env" | ForEach-Object {
            if ($_ -match '^GEMINI_API_KEY=(.*)$') {
                $env:GEMINI_API_KEY = $matches[1].Trim('"').Trim("'")
            }
        }
    }
}
& "$PSScriptRoot\.venv\Scripts\python.exe" "$PSScriptRoot\main.py" @args