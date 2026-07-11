# Quick & dirty setup of llm-router

## Set the router:

```bash
mkdir llm-router
cd llm-router
uv venv --python 3.12
source .venv/bin/activate
uv pip install "routellm[serve,eval]"
```

## Start it:

```bash
litellm --config config.yaml --port 8000
```

More info: https://docs.litellm.ai/docs/