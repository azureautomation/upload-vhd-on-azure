##On line 7 Enter path of your VHD that you want to upload

Function Upload-VHD ($storeN)

{
#Get local VHD name
$vhdName = 'D:\lab\DataDisk.vhd'

#Create new container in the storage account
$storeKey = Get-AzureStorageKey $storeN | %{ $_.Primary }
$storeContext = New-AzureStorageContext -StorageAccountName $storeN -StorageAccountKey $storeKey
$container = New-AzureStorageContainer datadisks -Permission Container -Context $storeContext

Start-Sleep -Seconds 60

#Upload the VHD to the storage container
$contUri = "{0}/datadisk1.vhd" -f $container.CloudBlobContainer.Uri.AbsoluteUri
Add-AzureVhd -LocalFilePath $vhdName -Destination $contUri -NumberOfUploaderThreads 5

Start-Sleep -Seconds 180
}
