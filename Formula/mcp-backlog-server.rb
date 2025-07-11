class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-aarch64-macos.tar.gz"
      sha256 "a2fa16266f647948380bc097d3c0543ef48d455318377dbb8090d36765067519"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-x86_64-macos.tar.gz"
      sha256 "888fbc41b8d5b96ec0670ce9f82d5a3ad816a52bf2f31d43a324336e1c7f9755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-aarch64-linux.tar.gz"
      sha256 "10d1f280c55e1d6e09d78952633b86101e5cdfb798cc1791c87491f3ea1249bb"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-x86_64-linux.tar.gz"
      sha256 "dfdc579f1d0cfa2b53f497e273ef2e284bb2c33865a1b87e044fdcce96f506ea"
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
        https://github.com/safx/backlog-mcp-server-rust#mcp-server
    EOS
  end

  test do
    assert_predicate bin/"mcp-backlog-server", :exist?
    assert_predicate bin/"mcp-backlog-server", :executable?
  end
end
