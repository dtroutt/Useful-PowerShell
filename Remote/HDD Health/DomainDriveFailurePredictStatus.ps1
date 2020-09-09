foreach ($COMPUTER in $(Get-ADComputer -Filter * -Searchbase 'CN=Computers, DC=HOMELAB,DC=LOCAL')){
Invoke-Command $COMPUTER.Name {Get-WmiObject -namespace root\wmi -class MSStorageDriver_FailurePredictStatus | Select PSComputerName,PredictFailure, Reason} |  Export-CSV "C:\Users\Administrator\Desktop\PowerShell\Remote\HDD HEALTH\DomainDriveFailurePredictStatus.csv" -NoTypeInformation -Append
}