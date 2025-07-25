#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="open-webui"

if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Stopping container '${CONTAINER_NAME}'…"
  docker stop "${CONTAINER_NAME}"
  echo "Removing container '${CONTAINER_NAME}'…"
  docker rm "${CONTAINER_NAME}"
  echo "Container removed."
else
  echo "No container named '${CONTAINER_NAME}' found."
fi
