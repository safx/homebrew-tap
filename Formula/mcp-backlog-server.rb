class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/mcp-backlog-server-v0.1.5-aarch64-macos.tar.gz"
      sha256 "be61cd1a074a06c3fc6d308d4ca6facd9a2450e57cd287998300cdaf42dee033"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/mcp-backlog-server-v0.1.5-x86_64-macos.tar.gz"
      sha256 "59d161890d73db1bf856c2c90c710ef8f7af30a35cbbaa593731c11b5d4691f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/mcp-backlog-server-v0.1.5-aarch64-linux.tar.gz"
      sha256 "d00387693d6278ff4e07689d1551e87056e1333d8b816602f6590f3d36e46f0d"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/mcp-backlog-server-v0.1.5-x86_64-linux.tar.gz"
      sha256 "7715653f0fcec5acea0d1d85336acdee1ae1dc0f4dc50931d5fcef40b2d15781"
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
    assert_path_exists bin/"mcp-backlog-server"
    assert_predicate bin/"mcp-backlog-server", :executable?
  end
end
