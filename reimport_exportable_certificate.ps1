# Re-import a PFX certificate as exportable on the local machine for non-interactive scripts.

$imports = Import-Csv "<path_to_thumbprint_csv>"
$certPath = "<path_to_pfx>.pfx"

$certPassword = ConvertTo-SecureString -String $imports[0].PFXPass -Force -AsPlainText
Import-PfxCertificate -FilePath $certPath -CertStoreLocation Cert:\LocalMachine\My -Password $certPassword -Exportable
