Get-Process | Get-Member -MemberType ScriptProperty,PropertySet
Get-Process | Get-Member -Name product
(Get-Process | Get-Member -Name product ).Definition
Get-Process | Format-Table psResources
