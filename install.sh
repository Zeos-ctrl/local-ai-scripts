#!/bin/sh
set -euo pipefail

# Install Docker if not already present
if ! command -v docker >/dev/null 2>&1; then
  echo "Installing Docker via pacman…"
  sudo pacman -Sy --noconfirm docker
else
  echo "Docker already installed."
fi

# Enable & start Docker service
echo "Enabling and starting docker.service…"
sudo systemctl enable --now docker.service

# Pull the Open-WebUI + Ollama image
echo "Pulling open-webui:ollama image…"
docker pull ghcr.io/open-webui/open-webui:ollama

# Make helper scripts executable
chmod +x start.sh stop.sh

echo "✔️  install.sh complete. Run ./start.sh to launch Open‑WebUI with Ollama."

