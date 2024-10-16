#!/bin/bash

REPONAME="${HUGGINGFACE_REPO}"

# check repo is provided
if [ -n "$REPONAME" ]; then
  echo "ERROR: Repo must be provided via the 'HUGGINGFACE_REPO' environment variable."
fi

# split repo and store model name only
MODELNAME=$(echo "$REPONAME" | cut -d "/" -f 2)
BASEDIR="/data"

# if model doesn't exist, fetch and convert it.
if [ ! -f "$BASEDIR/models/$MODELNAME.gguf" ]; then
  mkdir -p "$BASEDIR/models"
  echo "INFO: Downloading and converting model, this may take a while..."
  # install requirements
  apt update && apt install -y git python3 python3-pip
  python3 -m pip install huggingface_hub
  # download model
  python3 "$BASEDIR/download_hf_model.py" "$REPONAME" "$BASEDIR/$MODELNAME"
  # convert model
  python3 /app/convert_hf_to_gguf.py "$BASEDIR/$MODELNAME" --outfile "$BASEDIR/models/$MODELNAME.gguf"
  # cleanup
  rm -rf "${BASEDIR:?}/$MODELNAME"
fi

# run server
/app/llama-server --port 8081 --host 0.0.0.0 -m "$BASEDIR/models/$MODELNAME.gguf"