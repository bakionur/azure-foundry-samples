# azure-foundry-samples

Samples for Microsoft Foundry and Azure automation with PowerShell, Azure CLI, Bicep, Terraform and REST. This is the companion code for the posts on [bakionur.com](https://bakionur.com), [towershell.com](https://towershell.com), [azuredevops.org](https://azuredevops.org) and [automait.me](https://automait.me).

## How this repo is organised

Each sample lives in its own folder under `samples/`, with a short README that says what it does, which post it belongs to, and whether it has been run.

| Sample | What it does | Site | Status |
|---|---|---|---|
| [foundry-quota-tier](samples/foundry-quota-tier) | Check which Microsoft Foundry quota tier a subscription is on, across one or all subscriptions | towershell.com | Partly tested |
| [model-router](samples/model-router) | Deploy model router with a model subset and see which model answers each prompt | bakionur.com | Untested |

## What "tested" means here

- **Tested** means the script was run against a real Azure subscription on the date shown in the sample's README, and the output there is real.
- **Untested** means the script follows the official Microsoft documentation linked in the sample but has not been run yet. Treat it as a starting point and try it in a sandbox first.

Preview API versions and model names change. Check the linked docs before you rely on a sample in production.

## Using the samples

- Replace every placeholder such as `<subscription-id>` with your own values.
- No sample contains keys or secrets. Samples that need them read from environment variables.
- Some samples create Azure resources that cost money. Each README says so and shows how to clean up.

## Licence

MIT. See [LICENSE](LICENSE).
