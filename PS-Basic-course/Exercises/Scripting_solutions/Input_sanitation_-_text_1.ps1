Function New-ComputerName {
    param(
        [Parameter(Mandatory = $True)]
        [string]$ComputerName,
        [Parameter(Mandatory = $True)]
        [ValidateSet("Laptop", "Workstation", "Server")]
        [string]$Type
    )

    return $Type.Substring(0, 1).ToLower() + $ComputerName
}