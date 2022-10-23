### Return True if at least one network adapter is enabled ###
$data = Get-NetAdapter
$status = $data.Status 
"up" -in $status

### Return index and name of enabled adapters ###
Get-NetAdapter | ForEach-Object {If ($_.Status -match "Up") { Write-Output  ("Name: "+$_.Name, "Index: "+$_.ifIndex) }}

### disable enabled adapters ###
Get-NetAdapter |Where-Object status -eq up | Disable-NetAdapter -Confirm:$false

### enables back previously disabled adapters ###
Get-NetAdapter |Where-Object status -ne up | Enable-NetAdapter -Confirm:$false
