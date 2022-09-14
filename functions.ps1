#PRIVATE var (not readeable outside of function)
Function Example{
	$Private:nr = 9
	Write-Host "Nr: $nr" # 9
}
Example

#PRIVATE var (readeable outside of function)
Function Example{
	$global:nr = 9
	Write-Host "Nr: $nr" # 9
}
Example

#Calls other function with reference
function test {
   .'Example'
   &{Write-Host "Nr: $nr"}
}
test

