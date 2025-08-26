class Ccr < Formula
  desc "Claude Code statusline hook for usage statistics and costs"
  homepage "https://github.com/safx/ccr"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-macos.tar.gz"
      sha256 "a42bfb38f1cd7f6e76e5f43d3120b379dcff6eee7da9df095e8d14f113aa7aa3"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-macos.tar.gz"
      sha256 "1ee4e9a149057ed9f88f49c8206ae3452e703987d11328d3a5bb97255599e020"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-aarch64-linux.tar.gz"
      sha256 "ebf3ee1b8f6a6ca68307567dc24fdb877f13c23f27922fe982539eadbe9d0e52"
    else
      url "https://github.com/safx/ccr/releases/download/v0.1.0/ccr-v0.1.0-x86_64-linux.tar.gz"
      sha256 "aed932c1fd67a2ced58d24a204bd16af05d1d0ffa3399b19871250e5129706fc"
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
