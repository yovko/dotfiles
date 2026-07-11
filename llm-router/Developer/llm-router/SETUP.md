# Set it:
mkdir llm-router
cd llm-router
uv venv --python 3.12
source .venv/bin/activate
uv pip install "routellm[serve,eval]"

# Start it:
litellm --config config.yaml --port 8000
