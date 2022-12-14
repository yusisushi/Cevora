$folder = "c:\tmp"
# Using a script
$date = (Get-Date).Adddays(-10)
$files = Get-ChildItem -Path $folder -recurse -file

foreach ($file in $files) {
    if ($file.LastWriteTime -lt $date) {
        Remove-Item -Path $file.FullName -WhatIf
    }
}

# Using the pipeline
Get-ChildItem -Path $folder -recurse -File |
    ? {$_.LastWriteTime -lt $date} |
    Remove-Item  -WhatIf
