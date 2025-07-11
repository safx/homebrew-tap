class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-aarch64-macos.tar.gz"
      sha256 "1ea287c562acc4273c8e768cf57a4355032438ec0c6b3b3a42d00f416007290f"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-x86_64-macos.tar.gz"
      sha256 "27ddde8809afd3a4dc0e2be203d64ad3754afe69acb8625187e3aefd32092248"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-aarch64-linux.tar.gz"
      sha256 "ad9d62dc3f522da57e137943ab0d1aa04c64bbbd3cc7c23bf813ef45d0328a8f"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-x86_64-linux.tar.gz"
      sha256 "c219ad887150187753b8084b8edfe65a01d1d074848d8cc6ff692e5fb55ad36a"
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
