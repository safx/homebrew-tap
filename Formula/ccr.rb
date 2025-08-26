class Ccr < Formula
  desc "Claude Code statusline hook for usage statistics and costs"
  homepage "https://github.com/safx/ccr"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-macos.tar.gz"
      sha256 "cb5b185069a91c2c9f3210d278385840c71430b0dd8f9ff17e0c8aeb98000229"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-macos.tar.gz"
      sha256 "17b4c4715e11bbacc481f09d1747deb5bf04df1636b94f92b701ac2ecc3ab272"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-linux.tar.gz"
      sha256 "16a5d1a52c633cf392e874c908ad899651b27ce6f76a412801221ced8940fbd5"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-linux.tar.gz"
      sha256 "076ca10018c97f1a0ab5f9f5c9ca52aa4992522923fe51b3acd0345cc9cf94a7"
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
    assert_match /$/, output
  end
end
