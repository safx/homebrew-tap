class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-aarch64-macos.tar.gz"
      sha256 "19e32d394b593e9d22eb2732193cbb018e4c43a61ef2caddde7761b755e67560"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-x86_64-macos.tar.gz"
      sha256 "ec65d26de5d264d42fc97c474b1f75cea3ce9709d445674388ca2e75b7f5e277"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-aarch64-linux.tar.gz"
      sha256 "1d947782e807730b8a244b30858e4235ce1840c5fa4a2b1281a515c57776b322"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-x86_64-linux.tar.gz"
      sha256 "8afdc4b35a45636219d6c34a20c5e3f0684a7931c4b96fc6d657ffe2c7450db5"
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
