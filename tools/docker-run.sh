#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="joplin-plugin-admonition-dev"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <command...>"
	echo "Example: $0 npm ci"
	exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
	echo "docker command not found"
	exit 1
fi

# Keep update workflow stable even if yo overwrites package.json scripts.
if [[ "$1" == "npm" && "${2:-}" == "run" && "${3:-}" == "update" ]]; then
	shift 3
	if [[ "${1:-}" == "--" ]]; then
		shift
	fi
	set -- npx -y -p yo -p generator-joplin yo joplin --node-package-manager npm --update --force "$@"
fi

docker build -t "$IMAGE_NAME" -f "$ROOT_DIR/Dockerfile.dev" "$ROOT_DIR" >/dev/null

docker run --rm -it \
	--user "$(id -u):$(id -g)" \
	-v "$ROOT_DIR:/workspace" \
	-w /workspace \
	"$IMAGE_NAME" "$@"
