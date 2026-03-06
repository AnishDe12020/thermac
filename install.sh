#!/usr/bin/env bash
set -euo pipefail
BIN_DIR="${THERMAC_BIN_DIR:-$HOME/.local/bin}"
mkdir -p "$BIN_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SWIFT_SMC="$SCRIPT_DIR/vendor/stats-smc/smc.swift"
SWIFT_MAIN="$SCRIPT_DIR/vendor/stats-smc/main.swift"

if [[ ! -f "$SWIFT_SMC" || ! -f "$SWIFT_MAIN" ]]; then
  echo "Vendored SMC sources missing under vendor/stats-smc" >&2
  exit 1
fi

swiftc "$SWIFT_SMC" "$SWIFT_MAIN" -O -o "$BIN_DIR/smc-cli"
cp "$SCRIPT_DIR/thermac" "$BIN_DIR/thermac"
chmod +x "$BIN_DIR/thermac" "$BIN_DIR/smc-cli"

echo "Installed: $BIN_DIR/thermac"
echo "Installed: $BIN_DIR/smc-cli"
echo "Run: $BIN_DIR/thermac --json"
