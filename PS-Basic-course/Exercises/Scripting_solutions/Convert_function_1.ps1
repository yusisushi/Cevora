Function ConversionFahrenheitToCelsius ($fahrenheit) {
    $celsius = (($fahrenheit - 32 ) * 5 / 9)
    return $celsius
}

[int]$Fahrenheit = Read-Host -Prompt "Enter temperature in degrees Fahrenheit" #type declaration not mandatory
$Celsius = ConversionFahrenheitToCelsius $Fahrenheit

"{0:N0} °C" -f $Celsius
