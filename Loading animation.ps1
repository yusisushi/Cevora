$cursorTop = [Console]::CursorTop
$frames = '|', '/', '-', '\'
$counter = [int] 0
[Console]::CursorVisible = $false

while ($counter -lt 25) {
    $frame = $frames[$counter % $frames.Length]
    [Console]::SetCursorPosition(0, $cursorTop)
    Write-Host "$frame" -NoNewLine
    $counter++ #add 1 ti integer value
    Start-Sleep -m 100
}

[Console]::CursorVisible = $true
Write-Host ""
Write-Host "All done!"
