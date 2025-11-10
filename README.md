
---

## 🟩 `m365-security-governance-automation/README.md`

```markdown
# M365 Security & Governance Automation

Administrative PowerShell scripts that automate key Microsoft Purview, Exchange, and SharePoint governance tasks — from label creation to certificate management.

## Overview
This repository contains utilities that security and compliance administrators can use to standardize label policies, configure governance settings, and manage certificate-based authentication.

## Included Scripts

| Script | Description |
|--------|--------------|
| **create-labels-and-policy.ps1** | Creates default sensitivity labels (Public, Internal, Confidential, Highly Confidential) and publishes them via a label policy. |
| **disable-spo-default-labeling.ps1** | Disables automatic document library labeling at the SharePoint tenant level. |
| **hide-exchange-group.ps1** | Hides M365 groups from Exchange clients and disables welcome messages for new members. |
| **create-cert-and-service-principal.ps1** | Generates a self-signed certificate and registers it as a service principal for secure, non-interactive authentication. |
| **reimport-exportable-certificate.ps1** | Re-imports a `.pfx` certificate to the local machine store with exportable permissions. |
| **edm-data-upload-workflow.ps1** | Automates EDM (Exact Data Match) uploads: schema retrieval, validation, hashing, and upload using `EdmUploadAgent.exe`. |

## Prerequisites
- PowerShell 7+
- ExchangeOnlineManagement, AzureAD, and Security & Compliance modules
- Permissions:  
  - `Compliance Administrator`
  - `Exchange Administrator`
  - `SharePoint Administrator`
- If running EDM: ensure `EdmUploadAgent.exe` is accessible and authorized.

## Example Usage

```powershell
# Create baseline label set and policy
.\create-labels-and-policy.ps1

# Disable auto-labeling on SharePoint libraries
.\disable-spo-default-labeling.ps1

# Create service principal for automation
.\create-exportable-cert-and-service-principal.ps1 -TenantId "<tenantId>" -Org "<organization>" -AppId "<AppId>"
