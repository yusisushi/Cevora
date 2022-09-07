#Wildcards

A* #alles die begint met 'A'
Alex?nder #alles met eender welk karakter ipv '?'
Alex[abc]nder #alles met a,b of c tussen brackets

Get-Help Set-Alias -Examples

Set-Alias -Name 'grep' -Value select-string

### Display info;###

#On the screen
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

#Hash tables
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

Get-Process -Name *edge* |ft $proces,$cpu,$mem -AutoSize
