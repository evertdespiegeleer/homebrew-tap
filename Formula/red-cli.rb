class RedCli < Formula
  desc "Red, a TUI client for Redis"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-arm64"
      sha256 "8d36c0e0a35b1a5afb847cf9bef492a853ebeacb416a47b4a00bec76d96f7ec0"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-x64"
      sha256 "8d36c0e0a35b1a5afb847cf9bef492a853ebeacb416a47b4a00bec76d96f7ec0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-x64"
      sha256 "9f5f21c59ee1d16c8e9da50782c3c0dc17827374be17aa84504ae16c1818ca20"
    end

    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-arm64"
      sha256 "9f5f21c59ee1d16c8e9da50782c3c0dc17827374be17aa84504ae16c1818ca20"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "red-darwin-arm64" => "red"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "red-darwin-x64" => "red"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "red-linux-x64" => "red"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/red --version")
  end
end
