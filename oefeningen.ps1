#Wildcards

A* #alles die begint met 'A'
Alex?nder #alles met eender welk karakter ipv '?'
Alex[abc]nder #alles met a,b of c tussen brackets

Get-Help Set-Alias -Examples

Set-Alias -Name 'grep' -Value select-string

{#DISPLAY INFO
    Format-Table name, cpu, *id* -AutoSize
    Format-List
    Write-Host, Write-Output
    Out-Gridview
#In a file
    Out-File
    Out-Printer
    Export-CSV
    ConvertTo-XML
    Export-Cli
}

{#HASH TABLES
    $proces=@{
        Label="Process Name";
        Expression={$_.name};
        alignment="left"}

    $cpu=@{
        Label="CPU Used";
        Expression={$_.CPU};
        FormatString="N3"}

    $mem=@{
        Label="Memory";
        Expression={$_PM/1MB}}
}

{#OEFENINGEN
Get-Process -Name *edge* |ft $proces,$cpu,$mem -AutoSize

#show visual gridview and use input as pipe to command
Get-Process |Out-GridView -Title "hello world" -PassThru |stop-process #execute with enter

#Show name, CPU-usage and (nonpaged)memory of all processes starting with “N”
Get-Process -Name N* |ft name, NonpagedSystemMemorySize*

#Show all services starting with “A” in a list
Get-Service -Name A* |fl

#Write your name on the screen, in red with a green background (what Joe, Jack, William and Averell won’t like)
Write-Host "Yuska" -ForegroundColor red -BackgroundColor green

#Show all services with startuptype “automatic” that are not running in a gridview
Get-Service |select status,name,startuptype |Where-Object StartupType -eq automatic |Where-Object Status -eq stopped |Out-GridView

#Make sure you can click “ok” in above gridview to start these services
Get-Service |select status,name,startuptype |Where-Object StartupType -eq automatic |Where-Object Status -eq stopped |Out-GridView -PassThru |Start-Process
}

{ ### Reading Get-Date objects (System.DateTime)
Get-Date
$test123 = 123
$test123.GetType()
Set-Variable test123 abc
$test123.GetType()
}

"a" -eq "b"
Get-service |Where-Object { $_.StartType -contains 'a'  -or $_.Status -contains 'S'} 