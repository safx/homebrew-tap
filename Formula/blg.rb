class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/blg-v0.1.4-aarch64-macos.tar.gz"
      sha256 "33c4d2351fb94e3f9b091dfc9119ec1d2ec6c855351d8e664d1ca299a29d11e4"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/blg-v0.1.4-x86_64-macos.tar.gz"
      sha256 "d4821f664fe57f8990fc3c0e8293868113fc7fd1aabc087a88e90dbf3500c78b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/blg-v0.1.4-aarch64-linux.tar.gz"
      sha256 "2e9ce601aaef4a9cc156e4ba3d27edc358b0451d013dad5e2848505295e0745a"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.4/blg-v0.1.4-x86_64-linux.tar.gz"
      sha256 "1495945bfaef905977c4ce9c12948fa5566d7d3bacb93bc6e3eb95b560481bda"
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
