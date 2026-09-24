class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/blg-v0.1.5-aarch64-macos.tar.gz"
      sha256 "8d3ddfc2df5023281db3542bc8f413814cac5f53aa734e34b55cab8eef4f0cf5"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/blg-v0.1.5-x86_64-macos.tar.gz"
      sha256 "84414599be1552f880b447982050685a916a97d4270af34b6033cefa1e1d5105"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/blg-v0.1.5-aarch64-linux.tar.gz"
      sha256 "8f4dbea8646804f3118434dafe1a0dc52bc8e3daa9076b6e2b0a17eb2666f3a8"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.5/blg-v0.1.5-x86_64-linux.tar.gz"
      sha256 "b792a9ec41a55c2ce0a2a49f9a96a36e8fe18a0b46466f3eb17a6f207f95b625"
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
