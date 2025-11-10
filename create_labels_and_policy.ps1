# Creates sensitivity labels and a default label policy.

Connect-IPPSSession -UseRPSSession:$false

$publicLabel = New-Label -Name "Public" -DisplayName "Public" -Tooltip "Public information." -ContentType File
Set-Label -Identity $publicLabel.Identity -Comment "Manually applicable label." -Priority 0 -Settings '{"color":"#3A96DD"}'

$internalLabel = New-Label -Name "Internal" -DisplayName "Internal" -Tooltip "Internal information." -ContentType File
Set-Label -Identity $internalLabel.Identity -Comment "Default label for internal docs." -Priority 1 -Settings '{"color":"#13A10E"}'

$confidentialLabel = New-Label -Name "Confidential" -DisplayName "Confidential" -Tooltip "Confidential information." -ContentType File
Set-Label -Identity $confidentialLabel.Identity -Comment "Recommended when certain SITs are detected." -Priority 2 -Settings '{"color":"#EAA300"}'

$highConfLabel = New-Label -Name "Highly Confidential" -DisplayName "Highly Confidential" -Tooltip "Highly sensitive data." -ContentType File
Set-Label -Identity $highConfLabel.Identity -Comment "Recommended when highly sensitive SITs are detected." -Priority 3 -Settings '{"color":"#A4262C"}'

$policy = New-LabelPolicy -Name "Default Label Policy" -Labels @("Public","Internal","Confidential","Highly Confidential") -ModernGroupLocation "<m365_group_email>"
Set-LabelPolicy -Identity $policy.Id -Settings @{
    "mandatory" = "true"
    "powerbimandatory" = "false"
    "outlookdefaultlabel" = "None"
    "requiredowngradejustification" = "true"
    "defaultlabelid" = "$($internalLabel.Guid)"
}
