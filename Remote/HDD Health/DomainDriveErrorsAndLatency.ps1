foreach ($COMPUTER in $(Get-ADComputer -Filter * -Searchbase 'CN=Computers, DC=HOMELAB,DC=LOCAL')){
Invoke-Command $COMPUTER.Name {Get-Disk | Get-StorageReliabilityCounter | Select-Object PSComputerName,WriteLatencyMax,ReadLatencyMax,ReadErrorsCorrected,ReadErrorsTotal} | Sort-Object -Descending WriteLatencyMax |  Export-CSV "C:\Users\Administrator\Desktop\PowerShell\Remote\HDD HEALTH\DomainDriveErrorsAndLatency.csv" -NoTypeInformation -Append
}