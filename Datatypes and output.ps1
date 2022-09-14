#Wildcards

A* #alles die begint met 'A'
Alex?nder #alles met eender welk karakter ipv '?'
Alex[abc]nder #alles met a,b of c tussen brackets

Get-Help Set-Alias -Examples

Set-Alias -Name 'grep' -Value select-string


#region HASH TABLES -> Format your own output
$proces=@{
    Label="Process Name";
    Expression={$_.name};
    alignment="left"}

$cpu=@{
    Label="CPU Used";
    Expression={$_.CPU};
    FormatString="N3"} #numbers after comma

$mem=@{
    Label="Memory";
    Expression={$_PM/1MB}}
Get-Process -Name *edge* |ft $proces,$cpu,$mem -AutoSize

#endregion


#region FILTER OUTPUT
#OEFENINGEN
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

#AND parameters;
Get-Process |Where-Object StartupType -eq *a* |Where-Object Status -eq *S*
Get-Process |Where-Object {$_.Name -like "*N*" -and $_.Name -like "*pad*"} #-> quotation marks important!

#OR parameters -> brackets necessary;
Get-service |Where-Object {$_.Status -eq 'stopped'  -or $_.Status -eq 'running'}

#filter max output
Get-Process |Sort-Object CPU  |Select-Object -first 5

Get-Process |Get-Member 
Get-Process |Select-Object name,cpu |Get-Member

#Filtering result vs filtering visible output
Get-Process |Select-Object name,cpu
Get-Process |Format-Table name,cpu
Get-Process |Format-list name,cpu

#display name in UPPERCASE
Get-Process |Select-Object @{Name="UPNAME";Expression={"$($_.Name.ToUpper())"}}, CPU

$namestring = (Get-Process notepad).name
$namestring |Get-Member

#view all parameters for Get-Process command
Get-Command Get-Process
Get-Command Get-Process |get-member
Get-Command Get-Process |Select-Object -ExpandProperty parameters

#Group-Object
Get-Process |Get-Member |Sort-Object Name
Get-Process |Group-Object Company

Get-Process |measure-Object CPU |Get-Member
Get-Process notepad |measure-Object CPU -Sum -Average
#endregion


#OBJECT-EXERCISES
#How long has my CPU been used in minutes?
#Get-Process |Get-Member -> CPU = {get=$this.TotalProcessorTime.TotalSeconds;}
(Get-Process |Measure-Object cpu -Sum).sum # in SECONDS
(Get-Process |Measure-Object cpu -Sum).sum /60 #in m
(Get-Process |Measure-Object cpu -Sum).sum /60 /60 #in hours
(Get-Process |Measure-Object cpu -Sum).sum /60 /60 /24 #in days

#Get all services with a name longer than 7 characters
Get-Service |Where-Object {$_.Name -like "????????"}
Get-Service -Name "????????"

#What percentage of CPU are the 5 most CPU-intensive processes responsible for?
/

#From the Systemeventlog, show all messages Since 24 hours ago
Get-WinEvent -LogName system |Where-Object {$_.TimeCreated -ge (Get-Date).AddDays(-1) }

#That occured yesterday
/

#VAR DATATYPES
$a = 5 #will become suiteable datatype
$a = [int] 5 #will become integer
$a = [int] 5.6 #will become integer number 6
$a = [datetime] "01/17/1997" #will become date MM/DD/YYYY if recognized as date
$a.ToUpper() #script to convert text to uppercase
$a[2] #select second word
$a.Trim()
$a.Trim("a","b","c")

#set var read only
Set-Variable testfixedvar test123 -Option ReadOnly
#backtick
Write-Host "the value of `$testfixedvar is $testfixedvar"

$var = "b"
# the instance way
if($var.Equals("b")){
    Write-Host "Equal"}
else{
    Write-Host "Not equal" }  

$var = "b"
# the instance way
if($var.Equals("b")) {    Write-Host "Equal" } else {    Write-Host "Not equal" }  