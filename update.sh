#!/bin/bash

CURDIR="$(basename "$PWD")"

if [ "$CURDIR" == "rapidanalysis-open-webui" ]; then
  echo "INFO: Performing update..."\
  # delete containers
  docker compose down --rmi
  # delete program build files
  rm -rf "./open-webui" "./llama.cpp"
  # fetch repo update
  git pull
  # run installation
  ./install.sh
else
  echo "ERROR: Update script must be run from inside the RapidAnalysis OpenWebUI directory."
fi