class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/blg-v0.1.6-aarch64-macos.tar.gz"
      sha256 "476f860b36dece9b2f903db9d136ac5e98b3c7c9f53384d06410f819e7c96bad"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/blg-v0.1.6-x86_64-macos.tar.gz"
      sha256 "701015da8dab9a0356a0c868d8551f1ab97f8ed81f32aced57b247f7dc9cc05f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/blg-v0.1.6-aarch64-linux.tar.gz"
      sha256 "bb13de04b7d96f6402c13915f142262f46e5b7851ed37e46462abae037fcdf04"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.6/blg-v0.1.6-x86_64-linux.tar.gz"
      sha256 "8ac51d3d977dd702522bba7f0a7a9960983334e5ffb7effd497bbf27770c3c2a"
    end
  end

  def install
    bin.install "blg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blg --version 2>&1")
    assert_match "USAGE", shell_output("#{bin}/blg --help 2>&1")
  end
end
