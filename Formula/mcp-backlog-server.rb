class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-aarch64-macos.tar.gz"
      sha256 "84504e72bec51b100265a4afd1aa6c3484087f32ec87ca3abb57a954baed945a"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-x86_64-macos.tar.gz"
      sha256 "a3eedd9df85adfb336d89de15860cc904125d9373987ccd7042028800053b8b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-aarch64-linux.tar.gz"
      sha256 "f4063976e32f29b42bd2802671015bb376e05aa98c198d1de3f34c73ca80a55f"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/mcp-backlog-server-v0.1.2-x86_64-linux.tar.gz"
      sha256 "f9c2f7b0e31b789c2e99e0612e5544ffbc527ecae5979adeff4bb480b22bd920"
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
