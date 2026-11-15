# Model router

Deploy model router in Microsoft Foundry with a model subset, then send it a mix of prompts and see which underlying model answers each one.

## Files

| File | What it does | Changes anything? | Status |
|---|---|---|---|
| `deploy-model-router.sh` | Creates a model router deployment in Balanced mode, limited to four models | Yes, creates a deployment that is billed per use | Untested |
| `test_router.py` | Sends three prompts and prints the model that served each response | No | Untested |

Both follow the examples in the Microsoft Learn how-to linked below and have not been run against a live subscription yet.

## Before you run it

- Replace `<subscription-id>`, `<resource-group>` and `<foundry-account>` in the script.
- `test_router.py` reads `AZURE_OPENAI_ENDPOINT` and `AZURE_OPENAI_API_KEY` from the environment. Install the SDK with `pip install "openai>=1.75.0"`.
- The supported model list changes over time. Check the model names and versions against the current supported-models table before deploying.

## Clean up

Delete the `model-router-deployment` deployment from your Foundry resource when you are done.

## References

- [Use model router for Microsoft Foundry](https://learn.microsoft.com/azure/foundry/openai/how-to/model-router)
- [Model router for Microsoft Foundry: concepts](https://learn.microsoft.com/azure/foundry/openai/concepts/model-router)
- [What's new in model router](https://learn.microsoft.com/azure/foundry/foundry-models/whats-new-model-router)

## Posts

- English: https://bakionur.com/model-router-microsoft-foundry-stop-picking-models/
- Türkçe: https://bakionur.com/model-router-microsoft-foundry-model-secmeyi-birakin/
