#Requires -Modules Az.Accounts
<#
.SYNOPSIS
    Shows the Microsoft Foundry quota tier of the current Azure subscription.
.DESCRIPTION
    Read-only. Calls the quotaTiers resource of Microsoft.CognitiveServices and
    prints the tier name, the date it was assigned and the upgrade policy.
    Sign in first with Connect-AzAccount (not needed in Azure Cloud Shell).
.NOTES
    Tested 15 Nov 2026 in Azure Cloud Shell. Uses a preview API version.
#>

$subId = (Get-AzContext).Subscription.Id

$r = Invoke-AzRestMethod -Method GET -Path "/subscriptions/$subId/providers/Microsoft.CognitiveServices/quotaTiers?api-version=2025-10-01-preview"

($r.Content | ConvertFrom-Json).value.properties |
    Format-List currentTierName, assignmentDate, tierUpgradePolicy
