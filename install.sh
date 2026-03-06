#!/usr/bin/env bash
set -euo pipefail
BIN_DIR="${THERMAC_BIN_DIR:-$HOME/.local/bin}"
mkdir -p "$BIN_DIR"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
cd "$TMP"

git clone --depth=1 https://github.com/exelban/stats.git >/dev/null 2>&1
cd stats/SMC
swiftc smc.swift main.swift -O -o "$BIN_DIR/smc-cli"

cp "$OLDPWD/thermac" "$BIN_DIR/thermac"
chmod +x "$BIN_DIR/thermac" "$BIN_DIR/smc-cli"

echo "Installed: $BIN_DIR/thermac"
echo "Installed: $BIN_DIR/smc-cli"
echo "Run: $BIN_DIR/thermac --json"
