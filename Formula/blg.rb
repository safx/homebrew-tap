class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/blg-v0.1.0-aarch64-macos.tar.gz"
      sha256 "f563af3cb802e2007785b8f2e8618d2d96206a24a789de82ff31976186496c4d"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/blg-v0.1.0-x86_64-macos.tar.gz"
      sha256 "e5dd44f8b6eb58c9d7e105954c0b8cbba8ce461654f20bd059d584d2a2b344d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/blg-v0.1.0-aarch64-linux.tar.gz"
      sha256 "621f7306144eddefe60522ef1de9f48d2aa4230aca51a393b045b437089c2420"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.0/blg-v0.1.0-x86_64-linux.tar.gz"
      sha256 "afbd803ae28e6a86e737f7160846a0aaef83335c27e461635597986d00ca99ed"
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
