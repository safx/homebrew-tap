class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-aarch64-macos.tar.gz"
      sha256 "bb6a87994aecbff1aec7edfce8801372ea099d89f0ff1ba12434cef52c0d3fbd"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-x86_64-macos.tar.gz"
      sha256 "4181a32f7d34a1dae0ecdb14a19bb0b29e71c2bafcd67ceb6e48191e0c515988"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-aarch64-linux.tar.gz"
      sha256 "424d59f78ff6faebac19aac6359cff517ad03dd0a8a0869c954fd2a6b54b970b"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/mcp-backlog-server-v0.1.0-x86_64-linux.tar.gz"
      sha256 "7927c6b874fd39b6a438898de6288fac0d1e8c68539e80c5cbb603991e6fbb9d"
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
