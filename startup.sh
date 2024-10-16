CURDIR="$(basename "$PWD")"

if [ "$CURDIR" == "rapidanalysis-open-webui" ]; then
  # download required repos
  # repos are pinned to specific releases which are found compatible
  git clone --single-branch v0.3.32 https://github.com/open-webui/open-webui
  git clone --single-branch b3923 https://github.com/ggerganov/llama.cpp

  # replace relevant files with our own versions
  cp "./overwrite/*" "./open-webui"

  # run docker compose
  docker compose up
else
  echo "ERROR: Update script must be run from inside the RapidAnalysis OpenWebUI directory."
fi