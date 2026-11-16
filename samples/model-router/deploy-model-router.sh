#!/usr/bin/env bash
# Creates a model router deployment in Balanced mode, limited to four models.
# CREATES A BILLABLE DEPLOYMENT. Untested; adapted from the Microsoft Learn how-to.
# Replace the three placeholders before running. Requires Azure CLI, signed in.
set -euo pipefail

SUBSCRIPTION_ID="<subscription-id>"
RESOURCE_GROUP="<resource-group>"
FOUNDRY_ACCOUNT="<foundry-account>"

AZURE_AI_AUTH_TOKEN=$(az account get-access-token --resource https://management.azure.com --query accessToken -o tsv)

curl -X PUT "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}/providers/Microsoft.CognitiveServices/accounts/${FOUNDRY_ACCOUNT}/deployments/model-router-deployment?api-version=2025-10-01-preview" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${AZURE_AI_AUTH_TOKEN}" \
  -d '{
    "sku": {"name": "GlobalStandard", "capacity": 10},
    "properties": {
      "model": {"format": "OpenAI", "name": "model-router", "version": "2025-11-18"},
      "routing": {
        "mode": "balanced",
        "models": [
          {"format": "OpenAI", "name": "gpt-4.1-mini", "version": "2025-04-14"},
          {"format": "OpenAI", "name": "gpt-5-mini", "version": "2025-08-07"},
          {"format": "OpenAI", "name": "gpt-5.4", "version": "2026-03-05"},
          {"format": "OpenAI", "name": "gpt-5.5", "version": "2026-04-24"}
        ]
      }
    }
  }'
