class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-aarch64-macos.tar.gz"
      sha256 "9f85f1d2ef45ef918f3940b97e0f543bf779cacd534d131c723184d2faf10e1e"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-x86_64-macos.tar.gz"
      sha256 "653c78d51b5dbe6420afd855604750ba51b9254af7fd28f0355ccff1286035cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-aarch64-linux.tar.gz"
      sha256 "36bdc5dcb978090397c2a64ee9e8a57a9d2c1a0e36d95be126054b289e5c1d3c"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.2/blg-v0.1.2-x86_64-linux.tar.gz"
      sha256 "20f27c8e13f6bb589e071f8778b0e003840e7912e112b1fc090ba42a5c9a8ba2"
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
