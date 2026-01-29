class Ccr < Formula
  desc "Claude Code statusline hook for usage statistics and costs"
  homepage "https://github.com/safx/ccr"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.1/ccr-v0.1.1-aarch64-macos.tar.gz"
      sha256 "ab15611cfcb84df5a392dc7d2e2f971193e1304f5d6a71c5bd02be941f418cd7"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.1/ccr-v0.1.1-x86_64-macos.tar.gz"
      sha256 "b08b20af67d40286d9d37be6497312ebdcfb3a39ecfe65e8c86c44e66eac6550"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.1/ccr-v0.1.1-aarch64-linux.tar.gz"
      sha256 "89fa9334abc29e08ba3462a460583f275255d0004ecf86e5a45d823116452bc7"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.1/ccr-v0.1.1-x86_64-linux.tar.gz"
      sha256 "833ae4f25cbc2da09fd16e0469452eb55e08e37c2a7554a212075e63f01b54e7"
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
