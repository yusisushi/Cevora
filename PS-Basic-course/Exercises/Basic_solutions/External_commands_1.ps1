cls

C:\Windows\Notepad.exe
ipconfig /all
ipconfig /all | Get-Member
ipconfig /all | Select-String IPv4

# better:
Get-NetIPConfiguration | Format-List IPv4Address, InterfaceAlias
