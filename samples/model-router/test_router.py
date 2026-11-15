"""Send a mix of prompts to a model router deployment and print which model answered.

Untested; adapted from the Microsoft Learn how-to.
Reads AZURE_OPENAI_ENDPOINT and AZURE_OPENAI_API_KEY from the environment.
"""

import os

from openai import AzureOpenAI

DEPLOYMENT = "model-router-deployment"  # your deployment name

client = AzureOpenAI(
    azure_endpoint=os.environ["AZURE_OPENAI_ENDPOINT"],
    api_key=os.environ["AZURE_OPENAI_API_KEY"],
    api_version="2024-10-21",
)

prompts = [
    "How do I reset my VPN password?",
    "Summarise this incident timeline in three bullet points: ...",
    "Our nightly ETL fails only on the last day of the month. Here is the log: ... "
    "What is the most likely root cause?",
]

for prompt in prompts:
    response = client.chat.completions.create(
        model=DEPLOYMENT,
        messages=[{"role": "user", "content": prompt}],
    )
    print(response.model, "|", response.usage.total_tokens, "tokens |", prompt[:45])
