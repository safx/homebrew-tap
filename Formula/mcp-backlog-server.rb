class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/mcp-backlog-server-v0.1.3-aarch64-macos.tar.gz"
      sha256 "ab9c3b8b1b86afbcf928a4e3fc4625ee69eb0a0d250353fcc4d926296167ece9"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/mcp-backlog-server-v0.1.3-x86_64-macos.tar.gz"
      sha256 "968fdb172e7669dad65d04024aa3e882e6fdf73434ea6c40b1d5ac5b497f8c92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/mcp-backlog-server-v0.1.3-aarch64-linux.tar.gz"
      sha256 "de7c645f16be4e8a25d7eb8818ead8fb116fb24e6c7d9d6a145dcf19451ecfa6"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/mcp-backlog-server-v0.1.3-x86_64-linux.tar.gz"
      sha256 "8cc2aace9cbbd51f85c85a6e8cb01cb1f21102981566091f72d2a3a374148e58"
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
