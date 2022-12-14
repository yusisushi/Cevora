$dir = "C:\tmp"

$SubFolders = Get-ChildItem $dir -Directory -Force

foreach ($folder in $SubFolders) {
    $sizeFolder = (Get-ChildItem -path $folder.FullName -Recurse -Force -ErrorAction silentlycontinu |
            Measure-Object -Property length -sum).sum
    "{1,20:N0} KB`t`t{0} " -f $folder.FullName, ($sizeFolder / 1KB)
}

# the eldest:

# the eldest:

foreach ($folder in $SubFolders) {
    $eldestFolder = (Get-ChildItem -path $folder.FullName -Recurse -Force -ErrorAction silentlycontinu |
            Measure-Object -Property CreationTime -max).Maximum
    if($eldestFolder -lt (get-date).AddDays(-10))
    {
        Write-host "Last file creation time: $eldestFolder"
        Remove-Item $folder.FullName -WhatIf -Recurse
    }
    # "{1,20:N0} KB`t`t{0} " -f $folder.FullName, ($sizeFolder / 1KB)
}