$process=@{Label="Process Name";Expression={$_.name};alignment="left"}
$cpu=@{Label="CPU Used";Expression={$_.CPU};FormatString="N3";alignment="left"}
Get-Process | Format-Table $process,$cpu -autosize
