class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-aarch64-macos.tar.gz"
      sha256 "b04f479bdcd9018d1011a92ff9c430b0df0740960d8b17064b93e7b96d3fe04e"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-x86_64-macos.tar.gz"
      sha256 "102c7d3437221c16ebafd4f2fd445db6570e774e36441111e4e432988e99a602"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-aarch64-linux.tar.gz"
      sha256 "7ffcf32b5eb4e33801172ee0ad50055c725c64cf2997aa159f649a2ed3a2ce60"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-x86_64-linux.tar.gz"
      sha256 "2985cfc5de97b7cfd0afb4fef6956b337c6bd3b79bef7dbc5047a84946b33f04"
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
