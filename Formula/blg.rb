class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-mcp-server-rust"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-aarch64-macos.tar.gz"
      sha256 "4a75c1987ffce68f77875ed89e1f0323ee818141a58a8f91d975d5a1e0914243"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-x86_64-macos.tar.gz"
      sha256 "9b1faa941aa4806e81edf48562593b5163327e0d9d3f535a58229df26a32dab4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-aarch64-linux.tar.gz"
      sha256 "a1d613c0c0e427b5c179895bbf913673294b40c3d2e140a08ce93dbc9b10edf8"
    else
      url "https://github.com/safx/backlog-mcp-server-rust/releases/download/v0.1.1/blg-v0.1.1-x86_64-linux.tar.gz"
      sha256 "4d55e6e2cf675debb647b2515d1f4f8ec74f96cd3cdec6fe0f76d18fb815a4ea"
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
