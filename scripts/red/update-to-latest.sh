#!/usr/bin/env bash

# This script is meant to be run manually. It's not properly tested.

set -e
# Get the latest release version from GitHub
LATEST_RELEASE_INFO=$(curl -s https://api.github.com/repos/evertdespiegeleer/red-cli/releases/latest)
LATEST_VERSION=$(echo "$LATEST_RELEASE_INFO" | jq -r .tag_name)
STRIPPED_VERSION=${LATEST_VERSION#v}

# Update the sha256 checksums in the formula file
DARWIN_ARM64_SHA256=$(echo "$LATEST_RELEASE_INFO" | jq -r '.assets [] | select(.name == "red-darwin-arm64") | .digest | split(":")[1]')
DARWIN_X64_SHA256=$(echo "$LATEST_RELEASE_INFO" | jq -r '.assets [] | select(.name == "red-darwin-x64") | .digest | split(":")[1]')
LINUX_ARM64_SHA256=$(echo "$LATEST_RELEASE_INFO" | jq -r '.assets [] | select(.name == "red-linux-arm64") | .digest | split(":")[1]')
LINUX_X64_SHA256=$(echo "$LATEST_RELEASE_INFO" | jq -r '.assets [] | select(.name == "red-linux-x64") | .digest | split(":")[1]')

FORMULA_FILE="Formula/red-cli.rb"

# Update the version in the formula file
sed -i "" "s/version \".*\"/version \"$STRIPPED_VERSION\"/" "$FORMULA_FILE"

# Update SHA256 checksums using a more reliable approach
# For red-darwin-arm64
sed -i "" "/red-darwin-arm64/,+1 s/sha256 \".*\"/sha256 \"$DARWIN_ARM64_SHA256\"/" "$FORMULA_FILE"
# For red-darwin-x64
sed -i "" "/red-darwin-x64/,+1 s/sha256 \".*\"/sha256 \"$DARWIN_X64_SHA256\"/" "$FORMULA_FILE"
# For red-linux-arm64
sed -i "" "/red-linux-arm64/,+1 s/sha256 \".*\"/sha256 \"$LINUX_ARM64_SHA256\"/" "$FORMULA_FILE"
# For red-linux-x64
sed -i "" "/red-linux-x64/,+1 s/sha256 \".*\"/sha256 \"$LINUX_X64_SHA256\"/" "$FORMULA_FILE"