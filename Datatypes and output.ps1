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
    Expression={$_PM/1MB}
}
Get-Process -Name *edge* |ft $proces,$cpu,$mem -AutoSize

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