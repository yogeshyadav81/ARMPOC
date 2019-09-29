param (
    [string]$resourceGroupName,
    [string]$vmName,    
    [string]$vmSize
    
)

   #Stop-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vmName -Force
   $MyDomain='HCL'
$MyClearTextUsername='vipul_ku'
$MyClearTextPassword='Vip!060985'

$MyUsernameDomain=$MyDomain+’\’+$MyClearTextUsername

$SecurePassword=Convertto-SecureString –String $MyClearTextPassword –AsPlainText –force

$MyCredentials=New-object System.Management.Automation.PSCredential $MyUsernameDomain,$SecurePassword
Connect-AzureRmAccount $MyCredentials
   $vm = Get-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vmName
   $vm.HardwareProfile.VmSize = 'Standard_DS2_v2'#$vmSize

   Update-AzureRmVM -ResourceGroupName $resourceGroupName -VM $vm

   #Start-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vm.Name
