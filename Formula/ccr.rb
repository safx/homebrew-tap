class Ccr < Formula
  desc "Claude Code statusline hook for usage statistics and costs"
  homepage "https://github.com/safx/ccr"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-macos.tar.gz"
      sha256 "placeholder_sha256_aarch64_macos"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-macos.tar.gz"
      sha256 "placeholder_sha256_x86_64_macos"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-linux.tar.gz"
      sha256 "placeholder_sha256_aarch64_linux"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-linux.tar.gz"
      sha256 "placeholder_sha256_x86_64_linux"
    end
  end

  def install
    bin.install "ccr"
  end

  def caveats
    <<~EOS
      To use ccr with Claude Code, add to your ~/.claude/settings.json:
      {
        "statusline_hook": "ccr"
      }
    EOS
  end

  test do
    # Test with sample input matching the expected format
    input = '{"session_id":"test","cwd":"/tmp","transcript_path":"/dev/null","model":{"display_name":"claude-3-5-sonnet","max_output_tokens":8192}}'
    output = pipe_output("#{bin}/ccr", input)
    assert_match /\$/, output
  end
end