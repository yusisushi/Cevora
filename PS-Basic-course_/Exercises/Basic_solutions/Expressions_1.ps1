10 * ( 8+6 )

Get-Process -Id 10*(8+6) # wrong
Get-Process -Id (10*(8+6)) # correct


$name = "Hannah"
"Hello " + $name

Write-Output "Hello " + $name # wrong
Write-Output "Hello $name" # correct
Write-Output ("Hello " + $name) # correct