param (
    [string]$resourceGroupName,
    [string]$vmName,    
    [string]$vmSize
    
)

   #Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vmName -Force
   
   $vm = Get-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vmName
   $vm.HardwareProfile.VmSize = 'Standard_DS2_v2'#$vmSize

   Update-AzureRmVM -ResourceGroupName $resourceGroupName -VM $vm

   #Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vm.Name