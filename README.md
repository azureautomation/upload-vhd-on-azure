Upload VHD on Azure
===================

            
This Script was created to upload VHD on Azure using Powershell.


Simply edit the PS1 file based on the comments in the file to match your environment and you will have a simple way of uploading VHD on Azure.


Be sure to take note of the comments in the PS1 file to insert your input according to your environment.






PowerShell
Edit|Remove
powershell
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
$contUri = '{0}/datadisk1.vhd' -f $container.CloudBlobContainer.Uri.AbsoluteUri
Add-AzureVhd -LocalFilePath $vhdName -Destination $contUri -NumberOfUploaderThreads 5

Start-Sleep -Seconds 180
}


##On line 7 Enter path of your VHD that you want to uploadFunction Upload-VHD ($storeN) 
 
{ 
#Get local VHD name$vhdName = 'D:\lab\DataDisk.vhd'#Create new container in the storage account$storeKey = Get-AzureStorageKey $storeN| %{ $_.Primary } 
$storeContext = New-AzureStorageContext -StorageAccountName $storeN-StorageAccountKey $storeKey$container = New-AzureStorageContainer datadisks -Permission Container -Context $storeContextStart-Sleep-Seconds 60 
 
#Upload the VHD to the storage container$contUri = '{0}/datadisk1.vhd'-f $container.CloudBlobContainer.Uri.AbsoluteUri 
Add-AzureVhd -LocalFilePath $vhdName-Destination $contUri-NumberOfUploaderThreads 5 
 
Start-Sleep-Seconds 180 
} 









You can use this script in following steps:    



  *  Download the script. 
  *  Scroll down to line 7 of the script file, and then add path of VHD then
Save the script. 
  *  Open it using PowerShell. 
  *  Run Login-AzureRmAccount and enter your subscription admin account.

  *  Then run .\uploadvhd.ps1. 

    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
