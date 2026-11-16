#Requires -Modules Az.Accounts
<#
.SYNOPSIS
    Turns off automatic quota tier upgrades for the current subscription.
.DESCRIPTION
    CHANGES A SUBSCRIPTION SETTING. Sets tierUpgradePolicy to NoAutoUpgrade so the
    subscription stays on its current quota tier. The opt-out is a preview feature
    and may change or be removed.
.NOTES
    Untested. Adapted from the REST example on Microsoft Learn.
#>

$subId = (Get-AzContext).Subscription.Id

$body = @{ properties = @{ tierUpgradePolicy = 'NoAutoUpgrade' } } | ConvertTo-Json

Invoke-AzRestMethod -Method PATCH -Path "/subscriptions/$subId/providers/Microsoft.CognitiveServices/quotaTiers/default?api-version=2025-10-01-preview" -Payload $body
