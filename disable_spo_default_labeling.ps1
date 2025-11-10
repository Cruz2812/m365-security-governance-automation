# Disable SharePoint Online document library default labeling at the tenant level.

Import-Module Microsoft.Online.SharePoint.PowerShell

Connect-SPOService -Url "<https://tenant-admin.sharepoint.com>"

Set-SPOTenant -DisableDocumentLibraryDefaultLabeling $true

Get-SPOTenant | Select-Object DisableDocumentLibraryDefaultLabeling
