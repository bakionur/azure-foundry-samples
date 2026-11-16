# Foundry quota tier

Check which Microsoft Foundry quota tier an Azure subscription is on, with `Invoke-AzRestMethod`.

Quota for Foundry models depends on the subscription's quota tier (Free Tier and Tiers 1 to 6). The tier is evaluated per subscription and can move up automatically as usage grows.

## Scripts

| Script | What it does | Changes anything? | Status |
|---|---|---|---|
| `Get-FoundryQuotaTier.ps1` | Shows the tier, assignment date and upgrade policy for the current subscription | No, read-only | Tested 15 Nov 2026 in Azure Cloud Shell |

## Real output

`Get-FoundryQuotaTier.ps1`, run on a Visual Studio (MSDN) subscription:

```text
currentTierName   : Tier 1
assignmentDate    : 10/24/2025 1:15:29 PM
tierUpgradePolicy : OnceUpgradeIsAvailable
```

## Requirements

- PowerShell 7 with the `Az.Accounts` module, signed in with `Connect-AzAccount`. In Azure Cloud Shell you are already signed in.
- The calls use the preview API version `2025-10-01-preview`.

## References

- [Azure OpenAI in Microsoft Foundry Models quotas and limits](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits)
- [Invoke-AzRestMethod](https://learn.microsoft.com/powershell/module/az.accounts/invoke-azrestmethod)

## Posts

- English: https://towershell.com/microsoft-foundry-quota-tier-powershell/
- Türkçe: https://towershell.com/powershell-ile-microsoft-foundry-kota-seviyesi-sorgulama/
