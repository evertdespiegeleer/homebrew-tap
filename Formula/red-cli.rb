class RedCli < Formula
  desc "Red, a TUI client for Redis"
  homepage "https://github.com/evertdespiegeleer/red-cli"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-arm64"
      sha256 "f5252f55eb9f3b4982d5bf7dc2286fc215af164fd8b727da28f40b14741431e1"
    end

    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-darwin-x64"
      sha256 "f5252f55eb9f3b4982d5bf7dc2286fc215af164fd8b727da28f40b14741431e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-x64"
      sha256 "82539adf4d5a1533629dd787ce63aee93771e2bad2096dbd268fa02fe4b17143"
    end

    on_arm do
      url "https://github.com/evertdespiegeleer/red-cli/releases/download/v#{version}/red-linux-arm64"
      sha256 "82539adf4d5a1533629dd787ce63aee93771e2bad2096dbd268fa02fe4b17143"
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
