# Creates a self-signed cert, exports it, and registers a service principal for Purview/IPPSSession usage.

$cert = New-SelfSignedCertificate `
    -Subject "<subject_cn>" `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -KeyExportPolicy Exportable `
    -KeySpec Signature `
    -KeyLength 2048 `
    -NotAfter (Get-Date).AddYears(1)

$certPath = "Cert:\CurrentUser\My\$($cert.Thumbprint)"
$subject = $cert.Subject -replace "CN=", ""

Export-Certificate -Cert $certPath -FilePath "<export_cert_path>.cer"
Export-PfxCertificate -Cert $certPath -FilePath "<export_cert_path>.pfx" -Password (ConvertTo-SecureString -String "<pfx_password>" -Force -AsPlainText)

$tenantId = "<tenant_id>"
$org = "<organization_name>"
$appId = "<app_id>"
$objectId = "<object_id>"
$displayName = "<display_name>"
$certThumbprint = $cert.Thumbprint

# Test connection using certificate auth (after app is configured in tenant)
# Connect-IPPSSession -AppId $appId -Organization $org -CertificateThumbprint $certThumbprint

# Register service principal for Purview role group (requires proper permissions)
# Connect-IPPSSession
# New-ServicePrincipal -AppId $appId -ObjectId $objectId -DisplayName $displayName
# Add-RoleGroupMember -Identity "ContentExplorer_App" -Member $objectId
