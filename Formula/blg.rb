class Blg < Formula
  desc "Command-line interface for Backlog API"
  homepage "https://github.com/safx/backlog-api-client"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/blg-v0.1.0-aarch64-macos.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    else
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/blg-v0.1.0-x86_64-macos.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86_64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/blg-v0.1.0-aarch64-linux.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://github.com/safx/backlog-api-client/releases/download/v0.1.0/blg-v0.1.0-x86_64-linux.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X86_64"
    end
  end

  def install
    bin.install "blg"
    
    # Generate completions if the binary supports it
    # Uncomment these lines when shell completion is implemented
    # generate_completions_from_executable(bin/"blg", "completions", base_name: "blg",
    #                                      shells: [:bash, :zsh, :fish])
  end

  test do
    # Test version output
    assert_match version.to_s, shell_output("#{bin}/blg --version 2>&1")
    
    # Test help output
    assert_match "USAGE", shell_output("#{bin}/blg --help 2>&1")
  end
end