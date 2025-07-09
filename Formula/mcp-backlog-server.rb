class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-api-client"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-aarch64-macos.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    else
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-x86_64-macos.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86_64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-aarch64-linux.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-x86_64-linux.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X86_64"
    end
  end

  def install
    bin.install "mcp-backlog-server"
  end

  def caveats
    <<~EOS
      To use mcp-backlog-server, you need to set the following environment variables:
        export BACKLOG_BASE_URL="https://your-space.backlog.com"
        export BACKLOG_API_KEY="your-api-key"
      
      For MCP client configuration, see:
        https://github.com/safx/backlog-api-client#mcp-server
    EOS
  end

  test do
    # MCP server typically doesn't have a --version flag, so we just check existence
    assert_predicate bin/"mcp-backlog-server", :exist?
    assert_predicate bin/"mcp-backlog-server", :executable?
  end
end