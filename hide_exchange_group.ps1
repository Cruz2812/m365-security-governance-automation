# Hide a Microsoft 365 / Unified group from Exchange clients and disable welcome messages.

Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

$groupEmail = "<group_email_address>"
Set-UnifiedGroup -Identity $groupEmail -HiddenFromExchangeClientsEnabled:$true
Set-UnifiedGroup -Identity $groupEmail -UnifiedGroupWelcomeMessageEnabled:$false
