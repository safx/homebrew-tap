class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-aarch64-macos.tar.gz"
      sha256 "b7a4b80631d0f0c1e2218cc257f2a892fcc469fd10f700612faa3b3bbff5065a"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-x86_64-macos.tar.gz"
      sha256 "a5c751241b285b75f1ca3da468c90e5fc1d9bef46086cd587b450d70c6f20ae0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-aarch64-linux.tar.gz"
      sha256 "aaa394411e34458201aec2b71cef833a05a9a98ab10e85ee046bb5d7b226949e"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/mcp-backlog-server-v0.1.1-x86_64-linux.tar.gz"
      sha256 "b9143b5baeda563fdae6a57e4128acddd6f0344292c25a994d02c1901e0d3f30"
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
