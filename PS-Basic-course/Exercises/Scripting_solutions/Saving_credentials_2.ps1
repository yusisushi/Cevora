$cred = Get-Credential Administrator
$cred | Export-Clixml -Path c:\tmp\Credential.xml
notepad c:\tmp\Credential.xml
$newCred = Import-Clixml c:\tmp\Credential.xml
New-PSDrive -PSProvider FileSystem -Name Q -Root \\DC01.cursusdom.local\Shared -Credential $newCred
