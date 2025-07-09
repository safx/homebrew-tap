#!/bin/bash
# Script to update formula SHA256 hashes after a new release

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 0.1.1"
    exit 1
fi

VERSION=$1
BASE_URL="https://github.com/safx/backlog-api-client/releases/download/v${VERSION}"

# Function to get SHA256 for a URL
get_sha256() {
    local url=$1
    local filename=$(basename "$url")
    
    echo "Downloading $filename..."
    curl -sL "$url" -o "/tmp/$filename"
    
    if [ -f "/tmp/$filename" ]; then
        local sha=$(shasum -a 256 "/tmp/$filename" | awk '{print $1}')
        rm "/tmp/$filename"
        echo "$sha"
    else
        echo "Failed to download $url" >&2
        exit 1
    fi
}

echo "Updating formulae to version ${VERSION}..."

# Update blg.rb
BLG_ARM64_MACOS_SHA=$(get_sha256 "${BASE_URL}/blg-v${VERSION}-aarch64-macos.tar.gz")
BLG_X86_64_MACOS_SHA=$(get_sha256 "${BASE_URL}/blg-v${VERSION}-x86_64-macos.tar.gz")
BLG_ARM64_LINUX_SHA=$(get_sha256 "${BASE_URL}/blg-v${VERSION}-aarch64-linux.tar.gz")
BLG_X86_64_LINUX_SHA=$(get_sha256 "${BASE_URL}/blg-v${VERSION}-x86_64-linux.tar.gz")

# Update mcp-backlog-server.rb
MCP_ARM64_MACOS_SHA=$(get_sha256 "${BASE_URL}/mcp-backlog-server-v${VERSION}-aarch64-macos.tar.gz")
MCP_X86_64_MACOS_SHA=$(get_sha256 "${BASE_URL}/mcp-backlog-server-v${VERSION}-x86_64-macos.tar.gz")
MCP_ARM64_LINUX_SHA=$(get_sha256 "${BASE_URL}/mcp-backlog-server-v${VERSION}-aarch64-linux.tar.gz")
MCP_X86_64_LINUX_SHA=$(get_sha256 "${BASE_URL}/mcp-backlog-server-v${VERSION}-x86_64-linux.tar.gz")

# Update blg.rb
sed -i.bak -E "s/version \"[0-9.]+\"/version \"${VERSION}\"/" Formula/blg.rb
sed -i.bak -E "s|v[0-9.]+/blg-v[0-9.]+|v${VERSION}/blg-v${VERSION}|g" Formula/blg.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # ARM64 macOS/sha256 \"${BLG_ARM64_MACOS_SHA}\" # ARM64 macOS/" Formula/blg.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # x86_64 macOS/sha256 \"${BLG_X86_64_MACOS_SHA}\" # x86_64 macOS/" Formula/blg.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # ARM64 Linux/sha256 \"${BLG_ARM64_LINUX_SHA}\" # ARM64 Linux/" Formula/blg.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # x86_64 Linux/sha256 \"${BLG_X86_64_LINUX_SHA}\" # x86_64 Linux/" Formula/blg.rb

# Update mcp-backlog-server.rb
sed -i.bak -E "s/version \"[0-9.]+\"/version \"${VERSION}\"/" Formula/mcp-backlog-server.rb
sed -i.bak -E "s|v[0-9.]+/mcp-backlog-server-v[0-9.]+|v${VERSION}/mcp-backlog-server-v${VERSION}|g" Formula/mcp-backlog-server.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # ARM64 macOS/sha256 \"${MCP_ARM64_MACOS_SHA}\" # ARM64 macOS/" Formula/mcp-backlog-server.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # x86_64 macOS/sha256 \"${MCP_X86_64_MACOS_SHA}\" # x86_64 macOS/" Formula/mcp-backlog-server.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # ARM64 Linux/sha256 \"${MCP_ARM64_LINUX_SHA}\" # ARM64 Linux/" Formula/mcp-backlog-server.rb
sed -i.bak -E "s/sha256 \"[a-f0-9]+\" # x86_64 Linux/sha256 \"${MCP_X86_64_LINUX_SHA}\" # x86_64 Linux/" Formula/mcp-backlog-server.rb

# Clean up backup files
rm Formula/*.bak

echo "Updated formulae to version ${VERSION}"
echo ""
echo "SHA256 hashes:"
echo "blg ARM64 macOS: ${BLG_ARM64_MACOS_SHA}"
echo "blg x86_64 macOS: ${BLG_X86_64_MACOS_SHA}"
echo "blg ARM64 Linux: ${BLG_ARM64_LINUX_SHA}"
echo "blg x86_64 Linux: ${BLG_X86_64_LINUX_SHA}"
echo ""
echo "mcp-backlog-server ARM64 macOS: ${MCP_ARM64_MACOS_SHA}"
echo "mcp-backlog-server x86_64 macOS: ${MCP_X86_64_MACOS_SHA}"
echo "mcp-backlog-server ARM64 Linux: ${MCP_ARM64_LINUX_SHA}"
echo "mcp-backlog-server x86_64 Linux: ${MCP_X86_64_LINUX_SHA}"