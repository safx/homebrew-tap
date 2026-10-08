class McpBacklogServer < Formula
  desc "Model Context Protocol server for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/mcp-backlog-server-v0.1.6-aarch64-macos.tar.gz"
      sha256 "5453c7cc9295de0418b7104012f8492aad05987ef21496bf25e3fd57d1afb5fe"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/mcp-backlog-server-v0.1.6-x86_64-macos.tar.gz"
      sha256 "92f842adb51ce5d5777fea9a9bc412dd02035987de0268579b6904cf1c952db6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/mcp-backlog-server-v0.1.6-aarch64-linux.tar.gz"
      sha256 "523b7535f708553f4310923fdcf9085fcaaff828569500ae466f872d78cc2972"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/mcp-backlog-server-v0.1.6-x86_64-linux.tar.gz"
      sha256 "8b2f2726e07f8faf8fc0e79eb13d4bfd6dfa822aef16aad47cb4d1bfa637cd75"
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
