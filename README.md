# Homebrew Tap for Backlog API Client

Homebrew tap for [Backlog API Client](https://github.com/safx/backlog-api-client) tools.

## Installation

```bash
brew tap safx/tap
brew install blg
brew install mcp-backlog-server
```

## Available Formulae

- `blg` - Command-line interface for Backlog API
- `mcp-backlog-server` - Model Context Protocol server for Backlog API

## Usage

### blg CLI

```bash
# Set environment variables
export BACKLOG_BASE_URL="https://your-space.backlog.com"
export BACKLOG_API_KEY="your-api-key"

# Use the CLI
blg project list
blg issue list --project-key PROJECT
```

### MCP Server

See the [MCP configuration guide](https://github.com/safx/backlog-api-client#mcp-server) for setup instructions.

## Updating

```bash
brew update
brew upgrade blg
brew upgrade mcp-backlog-server
```

## Uninstalling

```bash
brew uninstall blg
brew uninstall mcp-backlog-server
brew untap safx/tap
```