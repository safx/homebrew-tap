class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/blg-v0.1.3-aarch64-macos.tar.gz"
      sha256 "eabe1b64fc39e12dcea3949d9741d4966cba1cc4b094a66971c8c4731355c34f"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/blg-v0.1.3-x86_64-macos.tar.gz"
      sha256 "f76f343402200a66e8c67a5ed9569848b02f33305779cd0dea7e2744ed1a49a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/blg-v0.1.3-aarch64-linux.tar.gz"
      sha256 "799b2619ce52c560081e7ee353c8cbd727efd9e1fb09ea3bcaef7b1ae5b5983f"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.3/blg-v0.1.3-x86_64-linux.tar.gz"
      sha256 "e2df970d6088dbfc4b130ec82f819c40cf31220800c41974461665e990c954fd"
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
