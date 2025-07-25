#!/bin/sh
set -euo pipefail

CONTAINER_NAME="open-webui"
HOST_PORT=3000
CONTAINER_PORT=8080

# If container exists, start it; otherwise create & run
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Starting existing container '${CONTAINER_NAME}'…"
  docker start "${CONTAINER_NAME}"
else
  echo "Creating and running container '${CONTAINER_NAME}' with GPU support…"
  docker run -d \
    --gpus=all \
    -p "${HOST_PORT}:${CONTAINER_PORT}" \
    -v ollama:/root/.ollama \
    -v open-webui:/app/backend/data \
    --name "${CONTAINER_NAME}" \
    --restart always \
    ghcr.io/open-webui/open-webui:ollama
fi

echo "Open‑WebUI + Ollama is now at http://localhost:${HOST_PORT}/"

