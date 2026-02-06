class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/mcp-backlog-server-v0.1.4-aarch64-macos.tar.gz"
      sha256 "d88f64957f910442eaedabb12678c2d63ec0a98058b83b70ff37728478f9b7ea"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/mcp-backlog-server-v0.1.4-x86_64-macos.tar.gz"
      sha256 "e9bb0a2a933a3cb089a9b7a74f19075097106aaea6fbd9e74106a94f071f3f3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/mcp-backlog-server-v0.1.4-aarch64-linux.tar.gz"
      sha256 "f4d6312e535133708912db6b22bfbfaddbe3a565296e21247d94d2b35e4bf4a0"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/mcp-backlog-server-v0.1.4-x86_64-linux.tar.gz"
      sha256 "2ca22d56fb014f9365f80e149a91c9791da87ce8dc77a745bb71aca145405610"
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
