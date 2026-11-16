#Requires -Modules Az.Accounts
<#
.SYNOPSIS
    Shows the Microsoft Foundry quota tier of every subscription you can see.
.DESCRIPTION
    Read-only. Loops over Get-AzSubscription and prints one table.
    Subscriptions that do not return a quota tier are skipped.
.NOTES
    Untested. Adapted from the REST example on Microsoft Learn.
#>

Get-AzSubscription | ForEach-Object {
    $r = Invoke-AzRestMethod -Method GET -Path "/subscriptions/$($_.Id)/providers/Microsoft.CognitiveServices/quotaTiers?api-version=2025-10-01-preview"
    if ($r.StatusCode -eq 200) {
        $p = ($r.Content | ConvertFrom-Json).value.properties
        [pscustomobject]@{
            Subscription  = $_.Name
            Tier          = $p.currentTierName
            Assigned      = $p.assignmentDate
            UpgradePolicy = $p.tierUpgradePolicy
        }
    }
} | Format-Table -AutoSize
