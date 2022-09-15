### find process and kill it if wanted
#ask the user for input, if he doesnt give input, repeat or suggest to cancel
$search = "$null"
while ($search -eq "$null"){
    Write-Host "Search for a process or press CTRL+C to cancel"
    $search = Read-Host "Search"
}

#specify result as array type @() so you can use length for empty result
$result = @(get-process -Name "*$search*" |Select-Object name,id)
while ($result.length -eq "0"){
    Write-Host -foregroundcolor Yellow -backgroundcolor black "No result found for $search"
    Write-Host "Enter search input or press CTRL+C to cancel"
    $search = Read-Host "Search"
    $result = @(get-process -Name "*$search*" |Select-Object name,id)
}

function inputid {
    $userinput = [int] 0
    while ($userinput -lt 1){
        Write-Host -foregroundcolor yellow -backgroundcolor black "These processes are found, type Process Id number to kill"
        $name=@{Label="Process-Name"; Expression={$_.Name}; alignment="left"}
        $id=@{Label="Process-Id";Expression={$_.Id}}
        $result |Format-Table $name,$id
        $userinput = Read-Host "Process Id"
        if (-not($result.id -contains $userinput)){
            inputid
        }
        else {
            $i = [int] 0
            Write-Host "Match, stopping process." -NoNewline
            Stop-Process -Id $userinput
            while ($i -lt 10){
                $i++
                Write-Host "." -NoNewline
                Start-Sleep -m 500
            }
        }
    }
}

inputid #runs only once but has a loop inside
exit


